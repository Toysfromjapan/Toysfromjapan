---
name: finishing
description: Turn approved AI video clips into a postable cut. Joins clips in order, trims bad head/tail frames, lays one continuous music bed under the whole cut (ducking each clip's own sound effects), matches color across shots, adds light film grain, short crossfades, and normalizes loudness to -14 LUFS. Use whenever clips from Higgsfield (Veo, Kling, Seedance, etc.) need to be assembled into a final video, or the user says "finish", "stitch", "assemble", "make it postable", or "final cut".
---

# Finishing

Raw generated clips each carry their own music, grade and grain, so a plain concat jumps at every cut. Finishing makes them read as one piece.

## Inputs to confirm before running

1. Clip order and the chosen take for each shot (from the shot QC step).
2. Trims: head/tail seconds to cut per clip (artifacts, speed lines, morphing).
3. Music: a supplied track, or none (then keep the clips' own audio with crossfades).
4. Output: aspect ratio and target (Reels/TikTok 1080x1920, YouTube 1920x1080).

## Run

`scripts/finish.sh` does the whole pass with ffmpeg. Run it where the clips are (locally, or in the Higgsfield sandbox via `sandbox_exec`, uploading the result with `media_upload` + `media_confirm`).

```
scripts/finish.sh -o out.mp4 [-m music.mp3] [-x 0.25] [-g 6] clip1.mp4[:trim_head[:trim_tail]] clip2.mp4 ...
```

- `-m` music bed, looped/trimmed to length, clip audio ducked under it to keep effects audible
- `-x` crossfade seconds between shots (default 0.25; 0 for hard cuts)
- `-g` grain strength (default 6; 0 to disable)

Color: every clip is normalized to the same contrast/saturation baseline. For a real grade, export with `-g 0` and grade in DaVinci Resolve.

## Check before delivery

- Pull a contact sheet of the finished file (`ffmpeg -vf fps=1/3,scale=320:-1,tile=5x2`) and look at it.
- Confirm duration, that no cut lands on a morphing frame, and loudness: `ffmpeg -i out.mp4 -af ebur128 -f null -` should report about -14 LUFS integrated.
