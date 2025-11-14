#!/usr/bin/env bash
set -euo pipefail

SESSION="taskwarrior"
WINDOW="Dashboard"
WORKSPACE=7

# Create the session if missing
if ! tmux has-session -t "${SESSION}" 2>/dev/null; then
  tmux new-session -d -s "${SESSION}" -n "${WINDOW}"
fi

# Launch Alacritty attached to the session
alacritty -e bash -lc "tmux attach -t ${SESSION}" &

# Move the Alacritty window to workspace 7
sleep 0.3
hyprctl dispatch movetoworkspace "${WORKSPACE}"
sleep 0.3

if [ "$(tmux list-panes -t "${SESSION}:${WINDOW}" | wc -l)" -eq 1 ]; then
  tmux split-window -h -l 65 -t "${SESSION}:${WINDOW}.0"
fi

if [ "$(tmux list-panes -t "${SESSION}:${WINDOW}" | wc -l)" -eq 2 ]; then
  tmux split-window -v -l 13 -t "${SESSION}:${WINDOW}.0"
fi

if [ "$(tmux list-panes -t "${SESSION}:${WINDOW}" | wc -l)" -eq 3 ]; then
  tmux split-window -v -l 11 -t "${SESSION}:${WINDOW}.0"
fi

if [ "$(tmux list-panes -t "${SESSION}:${WINDOW}" | wc -l)" -eq 4 ]; then
  tmux split-window -v -l 11 -t "${SESSION}:${WINDOW}.3"
fi

# Optional: run commands in the right pane
tmux select-pane -t "${SESSION}:${WINDOW}.3"
tmux send-keys -t "${SESSION}:${WINDOW}.3" "while true;do clear && task next limit:3;sleep 5;done" Enter

tmux select-pane -t "${SESSION}:${WINDOW}.2"
tmux send-keys -t "${SESSION}:${WINDOW}.2" "while true;do clear && task calendar;sleep 60;done" Enter

tmux select-pane -t "${SESSION}:${WINDOW}.1"
tmux send-keys -t "${SESSION}:${WINDOW}.1" "while true;do clear && timew summary;sleep 5;done" Enter


tmux select-pane -t "${SESSION}:${WINDOW}.4"
tmux send-keys -t "${SESSION}:${WINDOW}.4" "while true;do clear && timew;sleep 5;done" Enter

tmux select-pane -t "${SESSION}:${WINDOW}.0"
