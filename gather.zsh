#!/usr/bin/env zsh

# dbbolton
# https://github.com/dbb

for i in ${(f)"$( git ls-files )"}; { 
    cp -r ~/$i . 
}

git add ./^.*~

git commit -m "Update $( date +'c' )"
git push -u origin master

