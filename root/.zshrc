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
    HOST_SYM='♃'
elif [ $HOST == 'reddevil' ]; then
    HOST_SYM='♆'
elif [ $HOST == 'persephone' ]; then
    HOST_SYM='♇'
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



## git branch ##
    if [[ -d .git ]]; then
        GIT_BRANCH=`git branch | perl -ne 'print if s{\*\s*}{}'`
    else
        GIT_BRANCH=''
    fi

## end git branch ##

}

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

if [ $TERM == 'linux' ] ; then
    PROMPT='$PR_BLUE%n$PR_WHITE@$PR_RED%m$PR_WHITE:$PR_YELLOW%c$PR_WHITE%%$PR_NO_COLOR '
    RPROMPT='tty%l,%?? ${PR_RED}%D{%l:%M:%S %p}${PR_NO_COLOR}'

else
     PROMPT='
${PR_GREEN}root! ${PR_BLUE}${HOST_SYM}  ${PR_MAGENTA}%~ ${PR_RED}»${PR_NO_COLOR} '
    RPROMPT='${PR_YELLOW}${GIT_BRANCH}${PR_NO_COLOR}'
fi
}

setprompt

source "$HOME/.zaliases"
source "$HOME/.zshenv"
source "$HOME/.zfunctions"
