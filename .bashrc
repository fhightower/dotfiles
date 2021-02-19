alias sl='subl .'
alias code="cd ~/code; ls;"
alias pip='pip3'

# sublime aliases
alias cdsnip='cd /Users/floyd/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/snippets; ls;'
alias slsnip='cd /Users/floyd/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/snippets; ls; sl;'

# pipenv aliases
alias per='pipenv run'
alias pe='pipenv'
alias pytest='pipenv run pytest -v'
alias pytestc='pipenv run pytest -v --cov=.'
alias pytestcm='pipenv run pytest -v --cov=. --cov-report term-missing'
alias pepython='pipenv run python'
alias black='pipenv run black .'
alias pev='cd ~/.local/share/virtualenvs'
alias gi='git init -b main'

# docker-compose aliases
alias dcrp="docker-compose run --rm pytest"
alias dcrt="docker-compose run --rm test"
alias dcrl="docker-compose run --rm lint"
alias dcr="docker-compose run --rm"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcpsa="docker-compose ps -a"
alias dcps="docker-compose ps"
alias dcrd='docker-compose run --rm dev'
alias dc="docker-compose"
