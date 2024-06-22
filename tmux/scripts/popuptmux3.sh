#! /bin/bash

tmux_popup_session_name="[M-3]-popup_3"

if [ "$(tmux display-message -p -F "#{session_name}")" = "${tmux_popup_session_name}" ];then
    tmux detach-client
else
    tmux popup -d '#{pane_current_path}' -xC -yC -w95% -h95% -E\
      "tmux new-session -A -s ${tmux_popup_session_name}"
fi
