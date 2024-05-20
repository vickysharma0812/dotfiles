#! /bin/bash

tmux_popup_session_name="[M-t]-terminal"

if [ "$(tmux display-message -p -F "#{session_name}")" = "${tmux_popup_session_name}" ];then
    tmux detach-client
else
    tmux popup -d '#{pane_current_path}' -xc -yB -w100% -h30% -E\
      "tmux new-session -A -s ${tmux_popup_session_name}"
fi
