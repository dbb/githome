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

which dircolors >/dev/null && eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# setopt correctall

setopt complete_in_word
setopt list_ambiguous


# keys ######################################################################
autoload zkbd
function zkbd_file() {
    [[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
    [[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
    return 1
}

[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
keyfile=$(zkbd_file)
ret=$?
if [[ ${ret} -ne 0 ]]; then
    zkbd
    keyfile=$(zkbd_file)
    ret=$?
fi
if [[ ${ret} -eq 0 ]] ; then
    source "${keyfile}"
else
    printf 'Failed to setup keys using zkbd.\n'
fi
unfunction zkbd_file; unset keyfile ret

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Home]}"    ]]  && bindkey -M vicmd "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey -M vicmd "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   history-search-backward
[[ -n "${key[PageDown]}"   ]]  && bindkey  "${key[PageDown]}"   history-search-forward

bindkey -M vicmd '^R' redo
bindkey -M vicmd 'u'  undo
bindkey -M vicmd 'ga' what-cursor-position
bindkey -M vicmd 'q'  push-line

bindkey '^xp' history-beginning-search-forward
bindkey '^xn' history-beginning-search-backward
bindkey '^X^I' expand-or-complete-prefix
bindkey '^X^H' expand-history

bindkey '^o' accept-and-infer-next-history



#############################################################################

# host symbols
# if [ $TERM == 'rxvt-unicode' ]; then
if [ $HOST == 'ganymed' ]; then
    HOST_SYM='♃ '
elif [ $HOST == 'reddevil' ]; then
    HOST_SYM='♆ '
else
    HOST_SYM='%%'
fi

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
    if [[ -z $( git status | grep "nothing to commit" ) ]]; then
        GIT_STAT='+'
    fi


    if [[ -d .git ]]; then
        GIT_BRANCH=`git branch | perl -ne 'print if s{\*\s*}{}'`
    fi

    GIT_PROMPT="${GIT_STAT} ${GIT_BRANCH}"
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


# preexec () {
#     if [[ "$TERM" == "screen" ]]; then
#     local CMD=${1[(wr)^(*=*|sudo|-*)]}
#     echo -n "\ek$CMD\e\\"
#     fi
# }

setcolors () {
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE BLACK; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"
}

setcolors

# set $VIMODE to a default value ############################################
#VIMODE="$PR_RED-- INSERT --$PR_NO_COLOR"
# VIMODE='I'
# function zle-keymap-select {
# #   VIMODE="${${KEYMAP/main/$PR_RED-- INSERT --$PR_NO_COLOR}/vicmd/$PR_LIGHT_WHITE   NORMAL   $PR_NO_COLOR}"
#     VIMODE="${${KEYMAP/main/I}/vicmd/N}"
#     zle reset-prompt
# }
# zle -N zle-keymap-select

# function zle-cursor {
#     CURSNUM=${CURSOR}
#     zle reset-prompt
# }
# zle -N zle-cursor

setprompt () {
    # box-drawing characters
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

    setopt prompt_subst

    case $TERM in
    xterm*)
        PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
        ;;
    screen)
        PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
        ;;
    rxvt-unicode*)
        PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
        ;;
    *)
        PR_TITLEBAR=$'%n@%m:%~'
        ;;
    esac

    if [[ "$TERM" == "screen" ]]; then
    PR_STITLE=$'%{\ekzsh\e\\%}'
    else
    PR_STITLE=''
    fi

# a smaller prompt
#   PROMPT='--- $PR_RED%c$PR_BLUE %%$PR_NO_COLOR '

# older prompt, with blue user, red host, and yellow directory
#     PROMPT='$PR_BLUE%n$PR_WHITE@$PR_RED%m$PR_WHITE:$PR_YELLOW%c$PR_WHITE%%$PR_NO_COLOR '

#PROMPT='${(e)PR_TITLEBAR}$PR_BLUE%n$PR_WHITE@$PR_RED%m$PR_WHITE:$PR_YELLOW%c$PR_WHITE%%$PR_NO_COLOR '

# vim-like prompt

#   PROMPT='
#╔═ "${PR_BLUE}%~${PR_NO_COLOR}" ${FILECOUNT}, %? ${PR_BLUE}%n${PR_NO_COLOR}@${PR_RED}%M${PR_NO_COLOR}
#╚═ ${PR_LIGHT_YELLOW}%h ${VIMODE} %#${PR_NO_COLOR} '
#
#    RPROMPT='%l, ${PR_RED}%@${PR_NO_COLOR}'

#if [ $TERM == 'rxvt-unicode' ] ; then ########################################

  # PROMPT='
#╔═ "${PR_BLUE}%~${PR_NO_COLOR}" ${FILECOUNT}, %? ${PR_BLUE}%n${PR_NO_COLOR}@${PR_RED}%M${PR_NO_COLOR}$PR_HBAR${(e)PR_FILLBAR}
#╚═ ${PR_LIGHT_YELLOW}%h ${VIMODE} %#${PR_NO_COLOR} '

#    RPROMPT='%l, ${PR_RED}%@${PR_NO_COLOR}'
# ↬»↬ ♄

# Some interesting prompt chars
# ≻ ≽ ≿ ⊃ ⊇ ⋟ ⌘ ▶ ▷ ▸ ▹ ► ▻ ⚡ ❩ ❫ ❭ ❯ ❱ ➔ ➙ ➛ ➜ ➝ ➞ ➟
# ➠ ➡ ➢ ➣ ➤ ➥ ➳ ➵ ➸ ➺ ➻ ➼ ⇋ ⇌ ∫ ∬ ∭ ∴ ∵ ≍

PROMPT_CHAR='≻≻ '

if [ $TERM == 'linux' ] ; then
    PROMPT='$PR_BLUE%n$PR_WHITE@$PR_RED%m$PR_WHITE:$PR_YELLOW%c$PR_WHITE%%$PR_NO_COLOR '
    RPROMPT='tty%l,%?? ${PR_RED}%D{%l:%M:%S %p}${PR_NO_COLOR}'

else
     PROMPT='
${PR_BLUE}${HOST_SYM} ${PR_MAGENTA}${PR_DIR} ${PR_RED}${PROMPT_CHAR}${PR_NO_COLOR} '
        RPROMPT='${PR_YELLOW}${GIT_PROMPT}${PR_NO_COLOR}'
#    PROMPT='
#$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
#$PR_BLACK$PR_SHIFT_IN$PR_ULCORNER$PR_BLACK$PR_HBAR$PR_SHIFT_OUT(\
#${PR_BLUE}%n${PR_NO_COLOR}@$PR_RED%m${PR_NO_COLOR}:%l\
#$PR_BLACK)$PR_SHIFT_IN$PR_HBAR$PR_BLACK$PR_HBAR${(e)PR_FILLBAR}$PR_BLACK$PR_HBAR$PR_SHIFT_OUT(\
#$PR_MAGENTA%$PR_PWDLEN<...<"%~"${PR_NO_COLOR}, ${PR_CYAN}${FILECOUNT}L%<<\
#$PR_BLACK)$PR_SHIFT_IN$PR_HBAR$PR_BLACK$PR_URCORNER$PR_SHIFT_OUT\
#
#$PR_BLACK$PR_SHIFT_IN$PR_LLCORNER$PR_BLACK$PR_HBAR$PR_SHIFT_OUT(\
#%(?..$PR_LIGHT_RED%?$PR_BLACK:)\
#${PR_YELLOW}%h${PR_BLACK} | ${PR_NO_COLOR}VI:${PR_YELLOW}${VIMODE}\
#$PR_LIGHT_BLACK%(!.$PR_RED.$PR_WHITE)$PR_BLACK)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
#$PR_BLACK$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
#$PR_NO_COLOR%# '
#
#    RPROMPT=' $PR_BLACK$PR_SHIFT_IN$PR_BLACK$PR_SHIFT_OUT\
#(${PR_GREEN}${PR_ACPI}${PR_NO_COLOR},${PR_RED}%D{%l:%M%p}$PR_BLACK)$PR_SHIFT_IN$PR_HBAR$PR_BLACK$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOR'
#
#    PS2='$PR_BLACK$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
#$PR_BLACK$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
#$PR_LIGHT_GREEN%_$PR_BLACK)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
#$PR_BLACK$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOR '
#
fi
    #######################################################################

#
#else
#    PROMPT='%% '
#    RPROMPT=''
#fi

}

setprompt

source "$HOME/.zaliases"
source "$HOME/.zshenv"
source "$HOME/.zfunctions"
source "$HOME/perl/etc/bashrc"

