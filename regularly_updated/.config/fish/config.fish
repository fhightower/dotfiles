set -g -x fish_greeting "Get after it..."

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end

direnv hook fish | source

set bashrc $HOME/.bashrc
[ -f "$bashrc" ] && bash "$bashrc"

