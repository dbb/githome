# Applications
export BROWSER="/usr/bin/iceweasel"

# debian
export DEBEMAIL="dbb008@gmail.com"
export DEBFULLNAME="Daniel Bolton"

# directories
#export CDPATH=".:~:~/src"
export ZSH_DIR="$HOME/.config/zsh"
export gh="$HOME/src/githome"
export gc="$HOME/src/configs"
export gs="$HOME/src/scripts"
export nes="$HOME/Games/nes"
export n64="$HOME/Games/n64"
export ob="$HOME/.config/openbox"
export pd="$HOME/perl"
export PERLBREW_ROOT="$HOME/src/perl"

# files
export HISTFILE="${ZDOTFIR}/history"
export WWW_HOME="$HOME/Documents/home.html"

# githome
export GITHOME="$HOME/src/githome"

# grep
#export GREP_OPTIONS='--perl-regexp'

# history
export HISTSIZE=1024
export SAVEHIST=1024

# less
which lesspipe >/dev/null && eval "$(lesspipe)"
export LESS='-GRJx4P?f[%f]:[STDIN].?pB - [%pB\%]:\.\.\..'

# mail
export EMAIL='dbb008@gmail.com'
export MAIL='/var/mail/dbb'
export MAILPATH='/var/mail'

# make
#export CFLAGS="-march=core2 -O3 -pipe -m64 -mfpmath=sse -msse -msse2 -mssse3"
if [[ $HOST -eq 'persephone' ]]; then
    export CFLAGS="-march=core2 -mcx16 -msahf -mno-movbe -mno-aes -mno-pclmul -mno-popcnt -mno-abm -mno-lwp -mno-fma -mno-fma4 -mno-xop -mno-bmi -mno-bmi2 -mno-tbm -mno-avx -mno-avx2 -mno-sse4.2 -mno-sse4.1 -mno-lzcnt -mno-rtm -mno-hle -mno-rdrnd -mno-f16c -mno-fsgsbase -mno-rdseed -mno-prfchw -mno-adx -mfxsr -mno-xsave -mno-xsaveopt --param l1-cache-size=32 --param l1-cache-line-size=64 --param l2-cache-size=2048 -mtune=core2 -O2 -pipe"
else
    export CFLAGS='-march=native -O2 -pipe'
fi
export CXXFLAGS="${CFLAGS}"

[[ -f $( which nproc ) ]] && export CONCURRENCY_LEVEL=$( nproc )
#export MAKEFLAGS='-j 2'

# path
typeset -U path
for dir in ~/bin ${PERLBREW_ROOT}/bin /usr/lib/git-core/ ; do
    if [[ -z ${path[(r)$dir]} ]]; then
        path=($dir $path)
    fi
done

# programs
## Set vim as the EDITOR unless it doesn't exist
if [[ -f $( which vim ) ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
fi
## Same for less
[[ -f $( which less ) ]] && export PAGER='less'

# characters that are not part of a word
export WORDCHARS=${WORDCHARS//[-]}

