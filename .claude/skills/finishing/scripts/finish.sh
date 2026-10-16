#!/usr/bin/env bash
# Assemble clips into one finished cut: trims, crossfades, color baseline,
# grain, optional music bed with ducking, loudness at -14 LUFS.
set -euo pipefail

out=out.mp4; music=""; xf=0.25; grain=6; W=""; H=""
while getopts "o:m:x:g:s:" opt; do
  case $opt in
    o) out=$OPTARG ;; m) music=$OPTARG ;; x) xf=$OPTARG ;; g) grain=$OPTARG ;;
    s) W=${OPTARG%x*}; H=${OPTARG#*x} ;;
    *) echo "usage: finish.sh -o out.mp4 [-m music] [-x xfade] [-g grain] [-s WxH] clip[:head[:tail]] ..." >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))
[ $# -ge 1 ] || { echo "no clips given" >&2; exit 1; }

tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT

# Size defaults to the first clip's resolution.
first=${1%%:*}
if [ -z "$W" ]; then
  IFS=x read -r W H < <(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$first")
fi

# 1. Normalize each clip: trim, scale, fps, color baseline, stereo 48k audio.
i=0; durs=()
for spec in "$@"; do
  IFS=: read -r f head tail <<<"$spec"; head=${head:-0}; tail=${tail:-0}
  len=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$f")
  d=$(awk -v l="$len" -v h="$head" -v t="$tail" 'BEGIN{printf "%.3f", l-h-t}')
  ffmpeg -v error -y -ss "$head" -t "$d" -i "$f" \
    -vf "scale=${W}:${H}:force_original_aspect_ratio=increase,crop=${W}:${H},setsar=1,fps=24,eq=contrast=1.02:saturation=0.95" \
    -af "aresample=48000,aformat=channel_layouts=stereo" \
    -c:v libx264 -crf 16 -preset fast -pix_fmt yuv420p -c:a aac -b:a 192k "$tmp/c$i.mp4"
  durs+=("$d"); i=$((i + 1))
done

# 2. Join with crossfades (or hard cuts when xf is 0).
n=$i
if [ "$n" -eq 1 ] || awk -v x="$xf" 'BEGIN{exit !(x==0)}'; then
  for ((k = 0; k < n; k++)); do echo "file '$tmp/c$k.mp4'"; done >"$tmp/list.txt"
  ffmpeg -v error -y -f concat -safe 0 -i "$tmp/list.txt" -c copy "$tmp/joined.mp4"
else
  inputs=(); for ((k = 0; k < n; k++)); do inputs+=(-i "$tmp/c$k.mp4"); done
  fc=""; vprev="[0:v]"; aprev="[0:a]"; off=0
  for ((k = 1; k < n; k++)); do
    off=$(awk -v o="$off" -v d="${durs[$((k - 1))]}" -v x="$xf" 'BEGIN{printf "%.3f", o+d-x}')
    fc+="${vprev}[$k:v]xfade=transition=fade:duration=$xf:offset=$off[v$k];"
    fc+="${aprev}[$k:a]acrossfade=d=$xf[a$k];"
    vprev="[v$k]"; aprev="[a$k]"
  done
  ffmpeg -v error -y "${inputs[@]}" -filter_complex "${fc%;}" -map "$vprev" -map "$aprev" \
    -c:v libx264 -crf 16 -preset fast -pix_fmt yuv420p -c:a aac -b:a 192k "$tmp/joined.mp4"
fi

# 3. Grain, music bed with ducking, loudness.
vf="null"; [ "$grain" != 0 ] && vf="noise=alls=${grain}:allf=t"
if [ -n "$music" ]; then
  ffmpeg -v error -y -i "$tmp/joined.mp4" -stream_loop -1 -i "$music" -filter_complex \
    "[0:v]$vf[v];[1:a]aresample=48000,volume=0.6[m];[m][0:a]sidechaincompress=threshold=0.05:ratio=6:attack=20:release=300[md];[md][0:a]amix=inputs=2:duration=first:normalize=0,loudnorm=I=-14:TP=-1.5:LRA=11[a]" \
    -map "[v]" -map "[a]" -shortest -c:v libx264 -crf 18 -preset medium -pix_fmt yuv420p \
    -c:a aac -b:a 192k -movflags +faststart "$out"
else
  ffmpeg -v error -y -i "$tmp/joined.mp4" -vf "$vf" -af "loudnorm=I=-14:TP=-1.5:LRA=11" \
    -c:v libx264 -crf 18 -preset medium -pix_fmt yuv420p -c:a aac -b:a 192k -movflags +faststart "$out"
fi

echo "$out $(ffprobe -v error -show_entries format=duration -of csv=p=0 "$out")s"
