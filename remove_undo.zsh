#!/usr/bin/env zsh

# dbbolton
# https://github.com/dbb

for i in ${(f)"$( git ls-files | grep '~' )"}; { 
    print "Removing '$i'";
    git rm $i
}

git commit -m "Removing undo files (smh)"
git push -u origin master

