#!/bin/bash
# Prompt Gauntlet installer for macOS (also works on Linux).
# Installs the skill for Claude Code / the Claude desktop app's Code tab,
# and puts the interactive tool on your Desktop.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude/skills/prompt-gauntlet"
mkdir -p "$DEST"
cp -R "$HERE/skill/prompt-gauntlet/." "$DEST/"
DESK="$HOME/Desktop"
mkdir -p "$DESK"
cp "$HERE/Prompt Gauntlet.html" "$DESK/Prompt Gauntlet.html"
echo ""
echo "Prompt Gauntlet installed."
echo "  Skill:  $DEST"
echo "  Tool:   $DESK/Prompt Gauntlet.html"
echo ""
echo "Restart Claude, then say: run this through the gauntlet"
echo ""
read -n 1 -s -r -p "Press any key to close."
echo ""
