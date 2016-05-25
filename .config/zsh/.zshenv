# Applications
export BROWSER="/usr/bin/iceweasel"

# debian
export DEBEMAIL="dbb008@gmail.com"
export DEBFULLNAME="Daniel Bolton"

# directories
#export CDPATH=".:~:~/src"
export gh="${HOME}/src/githome"
export gc="${HOME}/src/configs"
export gs="${HOME}/src/scripts"
export nes="${HOME}/Games/nes"
export n64="${HOME}/Games/n64"
export ob="${HOME}/.config/openbox"
export pd="${HOME}/perl"
export PERLBREW_ROOT="${HOME}/src/perl"
export src="${HOME}/src"

# files
export HISTFILE="${ZDOTDIR}/history"
export WWW_HOME="${HOME}/Documents/home.html"

# githome
export GITHOME="${HOME}/src/githome"

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
if [[ $HOST == 'persephone' ]]; then
    export CFLAGS="-march=core2 -mcx16 -msahf -mno-movbe -mno-aes -mno-pclmul -mno-popcnt -mno-abm -mno-lwp -mno-fma -mno-fma4 -mno-xop -mno-bmi -mno-bmi2 -mno-tbm -mno-avx -mno-avx2 -mno-sse4.2 -mno-sse4.1 -mno-lzcnt -mno-rtm -mno-hle -mno-rdrnd -mno-f16c -mno-fsgsbase -mno-rdseed -mno-prfchw -mno-adx -mfxsr -mno-xsave -mno-xsaveopt --param l1-cache-size=32 --param l1-cache-line-size=64 --param l2-cache-size=2048 -mtune=core2 -O2 -pipe"
elif [[ $HOST == 'tyr' ]]; then
# flags: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt dtherm ida arat pln pts

# Intel Ivy Bridge CPU with 64-bit extensions, MMX, SSE, SSE2, SSE3, SSSE3, SSE4.1, SSE4.2, POPCNT, AVX, AES, PCLMUL, FSGSBASE, RDRND and F16C instruction set support. 

# gcc -march=ivybridge -Q --help=target
#-m64 -m80387 -m96bit-long-double -malign-stringops -mfancy-math-387 -mfentry -mfp-ret-in-387 -mglibc -mhard-float -mieee-fp -mlong-double-80 -mno-sse4 -mpush-args -mred-zone -mstackrealign -mtls-direct-seg-refs 

#gcc -march=native -Q --help=target |grep '\[enabled\]'|sort
# -m64 -m80387 -m96bit-long-double -maes -malign-stringops -mavx -mcx16 -mf16c -mfancy-math-387 -mfentry -mfp-ret-in-387 -mfsgsbase -mfxsr -mglibc -mhard-float -mieee-fp -mlong-double-80 -mmmx -mpclmul -mpopcnt -mpush-args -mrdrnd -mred-zone -msahf -msse2 -msse3 -msse4.1 -msse4.2 -msse4 -msse -mssse3 -mstackrealign -mtls-direct-seg-refs -mxsave -mxsaveopt 
    export CFLAGS=" -m64 -m80387 -m96bit-long-double -maes -malign-stringops -mavx -mcx16 -mf16c -mfancy-math-387 -mfentry -mfp-ret-in-387 -mfsgsbase -mfxsr -mglibc -mhard-float -mieee-fp -mlong-double-80 -mmmx -mpclmul -mpopcnt -mpush-args -mrdrnd -mred-zone -msahf -msse2 -msse3 -msse4.1 -msse4.2 -msse4 -msse -mssse3 -mstackrealign -mtls-direct-seg-refs -mxsave -mxsaveopt" 
else
    export CFLAGS='-march=native -O2 -pipe'
fi
export CXXFLAGS="${CFLAGS}"

[[ -f $( which nproc ) ]] && export CONCURRENCY_LEVEL=$( nproc )
#export MAKEFLAGS='-j 2'

# path
if [[ $PATH == '/usr/lib/git-core/:/home/dbb/src/perl/bin:/home/dbb/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin' ]]; then
    print "\t( Path already set; skipping ... )"
else
    typeset -U path
    for dir in ~/bin  /usr/lib/git-core/ ; do
        if [[ -z ${path[(r)$dir]} ]]; then
            path=($dir $path)
        fi
    done
fi

# programs
## Set vim as the EDITOR unless it doesn't exist
if [[ -f $( which vim ) ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
fi
## Same for less
[[ -f $( which less ) ]] && export PAGER='less'

# tabs
tabs -4

# characters that are not part of a word
export WORDCHARS=${WORDCHARS//[-]}

# zsf files
export ZLOGFILE="${ZDOTDIR}/zsh.log"
# zsh files (basenames only) for certain functions
export ZFILES_ALL=( .zshenv .zshrc aliases functions keys prompt )
export ZFILES_CUSTOM=( aliases functions keys prompt )



export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LOCALE="en_US.UTF-8"

