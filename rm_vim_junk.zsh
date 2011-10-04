#!/usr/bin/env zsh

# dbbolton
# https://github.com/dbb

if [[ -n $( ps -e | grep 'vim' ) ]]; then
    print "Vim is running; exiting";
    exit 1;
fi

for i in ${(f)"$( git ls-files | grep '~' )"}; { 
    print "Removing '$i'";
    git rm $i
}

for i in ${(f)"$( git ls-files| grep '\..*\.swp' )"}; {
    print "Removing '$i'";
    git rm $i
}

find . -name '*~' -delete
find . -iname '.*.swp' -delete


git commit -m "Removing undo and swap files (smh)"
git push -u origin master

