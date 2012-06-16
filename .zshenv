# debian
export DEBEMAIL="dan@dbbo.us"
export DEBFULLNAME="Daniel Bolton"

# directories
export CDPATH=".:~:~/src"
export gh="~/src/gh"
export gc="~/src/github/configs"
export gs="~/src/github/scripts"
export nes="~/games/nes"
export n64="~/games/n64"
export ob="~/.config/openbox"
export pd="~/perl"

# files
export HISTFILE="~/.zsh/history"
export WWW_HOME="~/Documents/home.html"

# grep
#export GREP_OPTIONS='--perl-regexp'

# history
export HISTSIZE=1000
export SAVEHIST=1000

# less
which lesspipe >/dev/null && eval "$(lesspipe)"
export LESS='-GRJx4P?f[%f]:[STDIN].?pB - [%pB\%]:\.\.\..'

# mail
export EMAIL='dan@dbbo.us'
export MAIL='/var/spool/mail/dbb'

# make
#export CFLAGS="-march=core2 -O3 -pipe -m64 -mfpmath=sse -msse -msse2 -mssse3"
export CFLAGS='-march=core2 -O2 -pipe'
export CXXFLAGS="${CFLAGS}"
export CONCURRENCY_LEVEL='2'
export MAKEFLAGS='-j 2'

# path
typeset -U path
for dir in ~/bin ~/games ~/perl/bin ; do
    if [[ -z ${path[(r)$dir]} ]]; then
        path=($dir $path)
    fi
done

# perlbrew
export PERLBREW_ROOT="~/perl"

# programs
export EDITOR='vim'
##export VIMRUNTIME='/usr/share/vim/vim73'
export PAGER='less'
export VISUAL='vim'

# characters that are not part of a word
export WORDCHARS=${WORDCHARS//[-]}

