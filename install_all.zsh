#!/usr/bin/env zsh

# dbbolton
# https://github.com/dbb

for file in ${(f)"$( git ls-files )"}; {
    if [[ -n $( diff "'./$file'" "'$HOME/$file'" ) ]]; then
        cp -r $file ~
    fi
}

print "done"

