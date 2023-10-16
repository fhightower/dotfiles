set -g -x fish_greeting "Get after it..."

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end

# direnv hook fish | source
export EXERCISM_TOKEN="1d44c66b-ed33-4a20-9d29-0e3f5c9421a4"

set bashrc $HOME/.bashrc
[ -f "$bashrc" ] && bash "$bashrc"

