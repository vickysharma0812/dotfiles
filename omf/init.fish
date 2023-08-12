
## Paths
#
# installing npm packages locally
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  
set PATH $PATH "/opt/homebrew/bin" "$HOME/Library/Python/3.9/bin"

# starship prompt
starship init fish | source

# fisher_path
# set -g -x fisher_path $__fish_config_dir


# easifem related
source ~/.config/easifem/easifemvar.fish

set -gx config $HOME/.config/
set -gx fish $config/omf
set -gx kitty $config/kitty
set -gx nvim $config/nvim
set -g -x dropbox $HOME/Dropbox/
set -gx dotfiles $dropbox/dotfiles
set -gx easifem $dropbox/easifem
set -gx base $easifem/easifem-base
set -gx classes $easifem/easifem-classes
set -gx tests $easifem/easifem-tests
set -gx vikas $HOME/Documents/Vikas
# set -gx docs $HOME/Documents/vickysharma0812.github.io
set -gx docs $HOME/Documents/easifemDocs
set -gx apps $easifem/apps
set -gx EDITOR /opt/homebrew/bin/nvim
set -gx EASIFEM_TEST_DIR $tests
set -gx onedrive ~/OneDrive
set -gx know ~/OneDrive/Knowledge
set -gx fem ~/OneDrive/Knowledge/FEM
set -gx lectures ~/OneDrive/Knowledge/LectureNotes
set -gx myweb ~/OneDrive/Knowledge/LectureNotes/VikasSharma

# To always Warpify the subshell for this command, add the following command to the end of your config.fish:
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'

## anaconda
#
source ~/anaconda3/etc/fish/conf.d/conda.fish

## rust
set PATH $PATH "$HOME/.cargo/bin"

set PATH $PATH "$HOME/.local/bin"

## GO related

set GOPATH $HOME/go
set PATH $PATH "$GOPATH/bin"


## rbenv 
status --is-interactive; and rbenv init - fish | source
