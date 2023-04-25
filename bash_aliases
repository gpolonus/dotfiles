export VISUAL=vim
export EDITOR="$VISUAL"

alias ea="code ~/dotfiles"
alias sa="source ~/.bash_aliases"
va() {
        cat ~/aliases/$1
}


### DEFAULTS

_default_vars() {
        GIT_BRANCH_PREFIX=""
        JIRA_TICKET_PREFIX=""
        GIT_DEV_BRANCH="develop"
        GIT_UPSTREAM="origin"
}

_load_vars() {
        _default_vars
}

### END DEFAULTS


### PULL DOWN UPDATES ONCE A DAY
alias day-date="date +%m-%d-%Y"

cd ~/dotfiles

echo "Pulling dotfiles changes"
if [ -f ".date" -a "$(day-date)" != "$(cat .date)" ]; then
        git fetch && git pull
fi;

day-date > .date
echo "Day date: $(cat .date)"

if [ -f ~/dotfiles/aliases/.hidden ]; then
        source ~/dotfiles/aliases/.hidden
fi;

LOCAL_ENV_NAME=''
for f in $(cat .env); do
        if [ -f ~/dotfiles/aliases/$f ]; then
                source ~/dotfiles/aliases/$f
                LOCAL_ENV_NAME="$f"
        fi;
done
cd -


# Create alias from terminal
# $1 location
# $2 name
# $3 command
_A() {
        if [ -z "$3" ]; then
                ENV="$LOCAL_ENV_NAME"
                ALIAS_NAME="$1"
                ALIAS_CONTENTS="$2"
        else
                ENV="$1"
                ALIAS_NAME="$2"
                ALIAS_CONTENTS="$3"
        fi

        if [ "$1" = "aliases" ]; then
                printf "\nalias $2=\"$3\"\n" >> ~/dotfiles/bash_aliases && _push_up_alias_changes
                return 0;
        fi

        printf "\nalias $ALIAS_NAME=\"$ALIAS_CONTENTS\"\n" >> ~/dotfiles/aliases/$ENV && _push_up_alias_changes
}

_D() {
        _A $1 $2 "cd $(pwd)"
}

_H() {
        ENV=".hidden"
        ALIAS_NAME="$1"
        ALIAS_CONTENTS="$2"
        printf "\nalias $ALIAS_NAME=\"$ALIAS_CONTENTS\"\n" >> ~/dotfiles/aliases/$ENV
}

_push_up_alias_changes() {
        cd ~/dotfiles
        git add .
        git commit -m "Automated Alias Changes"
        git push
        cd -
        sa
}

mkcd() {
	mkdir $1
	cd $1
}

alias npr="npm run "

alias frep="find ./ -type f | grep"
zcd() {
  cd $(find ./ -type d | fzf)
}
alias fcd="cd ~/project**"
alias fzd="find ./ -type d | fzf"

lert() {
  printf "\e[48;5;196m%03d $1"
  printf '\e[0m'
  echo
}

alias dotfiles="cd ~/dotfiles"

empty() {
  [ -z "$1" ]
}

alias lrep="ls | grep "

# things that dont work

# getoption() {
#   while getopts ":$1:" option; do
#     case $option in
#       l)
#         echo "$option"
#         exit;;
#     esac
#   done
# }

# colors() {
#         for((i=16; i<256; i++)); do
#         printf "\e[48;5;${i}m%03d" $i;
#         printf '\e[0m';
#         [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
#         done;
# }


# alias node="./node.js || node"

alias node_inits='node -i -e "$(< ./inits.js)"'

alias shrug="echo '¯\_(ツ)_/¯'"

# setopt no_bare_glob_qual

# Ensures that BLT can validate all the YAMLs during a git pre-push hook
ulimit -n 200000

alias numbers="seq "
