#! /bin/bash

tmux_popup_session_name="[popup-5]-easifem-base"
docs="~/Dropbox/easifem/easifem-base/"

if [ "$(tmux display-message -p -F "#{session_name}")" = "${tmux_popup_session_name}" ];then
    tmux detach-client
else
    tmux popup -d '${docs}' -xC -yC -w95% -h95% -E\
      "tmux new-session -A -s ${tmux_popup_session_name}"
fi
