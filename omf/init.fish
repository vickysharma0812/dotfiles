function fish_greeting
    # if type -q lolcat
    #     printf \
    #         "    ███████╗ █████╗ ███████╗██╗███████╗███████╗███╗   ███╗\n    ██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝████╗ ████║\n    █████╗  ███████║███████╗██║█████╗  █████╗  ██╔████╔██║\n    ██╔══╝  ██╔══██║╚════██║██║██╔══╝  ██╔══╝  ██║╚██╔╝██║\n    ███████╗██║  ██║███████║██║██║     ███████╗██║ ╚═╝ ██║\n    ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝\n"
    #     # | lolcat -F 2.0 -p 10.0 -S 100 
    # else
    #     echo "    ███████╗ █████╗ ███████╗██╗███████╗███████╗███╗   ███╗"
    #     echo "    ██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝████╗ ████║"
    #     echo "    █████╗  ███████║███████╗██║█████╗  █████╗  ██╔████╔██║"
    #     echo "    ██╔══╝  ██╔══██║╚════██║██║██╔══╝  ██╔══╝  ██║╚██╔╝██║"
    #     echo "    ███████╗██║  ██║███████║██║██║     ███████╗██║ ╚═╝ ██║"
    #     echo "    ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝"
    # end
    printf "      EASIFEM \n"
    printf "      Expandable And Scalable Infrastructure for Finite Element Methods \n"
    printf "      (c) Vikas Sharma, 2023 \n"
    printf "      https://www.easifem.com \n"
end

## Paths
#
# installing npm packages locally
set NPM_PACKAGES "$HOME/.npm-packages"
set NODE_PATH "$NPM_PACKAGES/lib/node_modules" $NODE_PATH
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

# starship prompt
if type -q starship
    starship init fish | source
end

## rbenv 
if type -q rbenv
    status --is-interactive; and rbenv init - fish | source
end

# fisher_path
# set -g -x fisher_path $__fish_config_dir

# easifem related
if test -f ~/.config/easifem/easifemvar.fish
    source ~/.config/easifem/easifemvar.fish
end

if type -q nvim
    set -gx EDITOR $(which nvim)
end

set -gx config $HOME/.config/
set -gx tmux $HOME/.config/tmux/
set -gx tmuxrc $HOME/.config/tmux/tmux.conf
set -gx fish $config/omf
set -gx fishrc $fish/init.fish
set -gx alacritty $config/alacritty/
set -gx alarc $alacritt/alacritty.yml
set -gx kitty $config/kitty
set -gx nvim $config/nvim
set -gx zellij $config/zellij
set -gx awesome $config/awesome
set -gx wezterm $config/wezterm
set -gx dropbox $HOME/Dropbox
set -gx dot $dropbox/dotfiles
set -gx VIMTEX_OUTPUT_DIRECTORY build

set -gx easifem $dropbox/easifem
set -gx base $easifem/easifem-base
set -gx classes $easifem/easifem-classes
set -gx materials $easifem/easifem-materials/
set -gx tests $easifem/easifem-tests
set -gx kernels $easifem/easifem-kernels/
set -gx elasticity $easifem/Elasticity/
set -gx vikas $HOME/Documents/Vikas
# set -gx docs $HOME/Documents/vickysharma0812.github.io
set -gx docs $HOME/Documents/easifemDocs
set -gx apps $easifem/apps
set -gx EASIFEM_TEST_DIR $tests
set -gx onedrive ~/OneDrive
set -gx know ~/OneDrive/Knowledge
set -gx fem ~/OneDrive/Knowledge/FEM
set -gx lectures ~/OneDrive/Knowledge/LectureNotes
set -gx pub ~/OneDrive/Publications
set -gx subpub ~/OneDrive/Publications/Submitted/
set -gx onpub ~/OneDrive/Publications/Ongoing/
set -gx notes $lectures/Notes/
set -gx myweb ~/OneDrive/Knowledge/LectureNotes/VikasSharma
set -gx play ~/OneDrive/Playground/
set -gx lyxdocs ~/Documents/lyx/

## alias and functions 
#

alias skim='/Applications/Skim.app/Contents/MacOS/Skim'

function v
    nvim $argv
end


function fishme
    source $fishrc
end


function rebuid_easifem
    easifem clean base classes materials kernels $argv
    cd $base && python3 install.py && cd $classes && python3 install.py && cd $materials && python3 install.py && cd $kernels && python3 install.py && cd $elasticity && python3 install.py
end

alias cdoc="cd $docs" # cd to docs
alias vdoc="cd $docs && nvim ." # cd to docs
alias vfish="nvim $fishrc" # cd to docs
alias vvim="cd $nvim && nvim ~/.config/nvim/lua/config/lazy.lua"
alias czel="cd $zellij"
alias vzel="cd $zellij && nvim ./config.kdl"
alias clec="cd $lectures"
alias vlec="cd $lectures && nvim ./README.md"

# To always Warpify the subshell for this command, add the following command to the end of your config.fish:
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'

if type -q brew
    set PATH $PATH /opt/homebrew/bin "$HOME/Library/Python/3.11/bin"
end

if test -d /opt/eww/eww-v0.4.0
    set PATH $PATH /opt/eww/eww-v0.4.0
end


## rust
set PATH $PATH "$HOME/.cargo/bin"
set PATH $PATH "$HOME/.local/bin"

## GO related
set GOPATH $HOME/go
set PATH $PATH "$GOPATH/bin"

## anaconda
#
if test -f ~/anaconda3/etc/fish/conf.d/conda.fish
    # echo "Sourcing conda Python3 🐍"
    source ~/anaconda3/etc/fish/conf.d/conda.fish
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if type -q ~/anaconda3/bin/conda
    eval ~/anaconda3/bin/conda "shell.fish" hook $argv | source
    # echo "Activating 🚀 EASIFEM conda env 🌿"
    conda activate easifem
end
# <<< conda initialize <<<


set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx VISUAL nvim



fish_vi_key_bindings
