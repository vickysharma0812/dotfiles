#! /bin/bash
tmux popup -d '#{pane_current_path}' -xC -yC -w80% -h80% "serpl" >/dev/null || true

