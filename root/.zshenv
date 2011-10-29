# debian
export DEBEMAIL="dan@dbbo.us"
export DEBFULLNAME="Daniel Bolton"

# files
export HISTFILE="$HOME/.zhistory"

# history
export HISTSIZE=1000
export SAVEHIST=1000

# less
which lesspipe >/dev/null && eval "$(lesspipe)"
export LESS='-GRJx4P?f[%f]:[STDIN].?pB - [%pB\%]:\.\.\..'

# mail
export EMAIL='dan@dbbo.us'
export MAIL='/var/spool/mail/root'

# make
#export CFLAGS="-march=core2 -O3 -pipe -m64 -mfpmath=sse -msse -msse2 -mssse3"
export CFLAGS='-march=core2 -O2 -pipe'
export CXXFLAGS="${CFLAGS}"
export CONCURRENCY_LEVEL='2'
export MAKEFLAGS='-j 2'

# path
typeset -U path
for dir in ~/bin ; do
    if [[ -z ${path[(r)$dir]} ]]; then
        path=($dir $path)
    fi
done

# perlbrew
export PERLBREW_ROOT="$HOME/perl"

# programs
export EDITOR='vim'
export PAGER='less'
export VISUAL='vim'

# characters that are not part of a word
export WORDCHARS=${WORDCHARS//[-]}

