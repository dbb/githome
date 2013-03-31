# dbbolton's zshrc

umask 022

# options
bindkey -v
setopt append_history
setopt auto_list
setopt correct

setopt extended_glob
setopt glob_dots
setopt nullglob
setopt equals
#setopt glob_subst

setopt extended_history
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt inc_append_history
setopt interactive_comments
setopt list_packed
setopt magic_equal_subst
setopt nonomatch

# URL quote magic
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# completion
autoload -U compinit
compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

which dircolors >/dev/null && eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*:cd:*' ignore-parents parent pwd


# setopt correctall

setopt complete_in_word
setopt list_ambiguous

# chpwd () {
#     local -a files
#     files=( *(N) )
#     FILECOUNT="$#files"
# }
# call the above function to set $FILECOUNT on login
#chpwd

function precmd {

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    PR_FILLBAR=""
    PR_PWDLEN=""

    local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}
    local filesize=${#${(%):-$FILECOUNT}}

    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
        ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
        PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize + $filesize + 5)))..${PR_HBAR}.)}"
    fi

    # note: the 5 is for extra characters added: two double-quotes, a comma,
    # a space, and an L

## battery info ##
    # if which acpi > /dev/null; then
    #     #PR_ACPI=`acpi -b | awk '{print $4}'`
    #     charge_pct=`acpi -b | perl -ne 'print $1."%%" if /(\d+)%/;'`
        # pwr_src=`acpi -a | perl -ne 'if (/off-line/) { print "Bat"; } elsif (/on-line/) { print "AC"; } else { print "?"; }'`
        # PR_ACPI="$charge_pct $pwr_src"
    # else
        # PR_ACPI='?'
    # fi
## end battery info ##

## git stuff ##
    GIT_STAT=''
    GIT_BRANCH=''
if [[ -d .git ]]; then
    GIT_BRANCH=$( git branch | perl -ne 'print if s{\*\s*}{}' )
    GIT_SHA=$( git rev-parse --short HEAD )
    if [[ -z $( git status | grep "nothing to commit" ) ]]; then
        GIT_STAT='+'
    fi
    GIT_PROMPT="${GIT_STAT} ${GIT_BRANCH} ${GIT_SHA}"
else
        GIT_BRANCH=''
        GIT_STAT=''
        GIT_PROMPT=''

fi

## dir name
    count=$( print $PWD | wc -c )

    if [[ $count -lt 30 ]]; then
        PR_DIR='%~'
        PR_RDIR=''
    else
        PR_DIR='…/%c'
    fi
}

## root
# Some interesting prompt chars
# %% » › > │
# ≻  ≽≿ ⊃ ⊇ ⋟ ⌘ ▶ ▷ ▸ ▹ ► ▻ ⚡ ❩ ❫ ❭ ❯ ❱ ➔ ➙ ➛ ➜ ➝ ➞ ➟
# ➠ ➡ ➢ ➣ ➤ ➥ ➳ ➵ ➸ ➺ ➻ ➼ ⇋ ⇌ ∫ ∬ ∭ ∴ ∵ ≍
PROMPT_CHAR='»'
if [[ $UID -eq 0 ]]; then
    ROOT_NAME='(root) '
    PROMPT_CHAR='%#'
else
    ROOT_NAME=''
    PROMPT_CHAR='»'
fi

# preexec () {
#     if [[ "$TERM" == "screen" ]]; then
#     local CMD=${1[(wr)^(*=*|sudo|-*)]}
#     echo -n "\ek$CMD\e\\"
#     fi
# }


## source external files
ext_dir="$HOME/.zsh"
ext_files=( aliases functions keys prompt )
for file in $ext_files; do
    [[ -f ${ext_dir}/${file} ]] && source ${ext_dir}/${file}
done

