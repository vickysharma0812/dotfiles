#! /bin/bash

tmux_popup_session_name="buildClasses"

if [ "$(tmux display-message -p -F "#{session_name}")" = "${tmux_popup_session_name}" ];then
    tmux detach-client
else
    tmux popup -d '#{pane_current_path}' -xR -yC -w30% -h70% -E\
      "tmux new-session -A -s ${tmux_popup_session_name}"
    easifem install classes --no-download
fi
