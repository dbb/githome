#!/usr/bin/env zsh

# dbbolton
# https://github.com/dbb

input="$1"
found=( ${(f)"$( find . -iname "*$1" )"} )

if [[ -e $1 ]]; then

    print "copying $1 to ~"
    cp $1 ~

else

    print "Not such file: '$input'.\n""Did you mean:\n"

    for i in $found; {
        print $i
    }

    exit 1;

fi

