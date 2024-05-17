#! /bin/bash

session="buildBase"
# cmd="easifem install base --no-download"
cmd="echo Hello"
# session=whatever
window=${session}:0
pane=${window}.4

if [ "$(tmux display-message -p -F "#{session_name}")" = "${session}" ];then
    tmux detach-client
else
tmux send-keys -t "$pane" C-z 'some -new command' Enter
tmux select-pane -t "$pane"
tmux select-window -t "$window"
# tmux attach-session -t "$session"
    tmux popup -d '#{pane_current_path}' -xR -yC -w30% -h70% -E\
      "tmux new-session -A -s ${session}"
fi
