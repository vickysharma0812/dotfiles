#! /bin/bash

tmux_popup_session_name="[M-d]-easifem-docs"
docs="${HOME}/Documents/easifem.github.io/docs/docs-api/"

if [ "$(tmux display-message -p -F "#{session_name}")" = "${tmux_popup_session_name}" ];then
    tmux detach-client
else
    tmux popup -d ${docs} -xC -yC -w100% -h100% -E\
      "tmux new-session -A -s ${tmux_popup_session_name}"
fi
