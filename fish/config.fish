if status is-interactive
    # Commands to run in interactive sessions can go here
end


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/easifem/anaconda3/bin/conda
    eval /Users/easifem/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

conda activate easifem

