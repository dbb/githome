#!/usr/bin/env zsh

# dbbolton
# https://github.com/dbb

git_dir="${HOME}/src/githome"
git_change=0
action=$argv[1]
shift
names=($argv);

cd $git_dir && git pull

## This function is for "downloading" a file-- i.e. get the latest version 
## from the master branch and copy it to ~.
down () {
    base=$1
    file="${git_dir}/${base}"
    if [[ -e $file ]]; then
        if [[ -n $( diff ~/${input} $file ) ]]; then
            cp -rv $file ~
        else
            print "Files are the same."
        fi
    else
        found $git_dir 4
    fi
}

## This function is for "uploading" a local file-- i.e. copy it from ~ to the 
## proper git dir.
up () {
    base=$1
    file="${HOME}/${base}"
    if [[ -e $file ]]; then
        if [[ -n $(diff $file ${git_dir}/${1} ]]; then
            cp -rv ${file} $git_dir
            cd $git_dir
            git add $1 && git_change=1
        
        else
            print "$base is already up-to-date."
        fi
    else
        found $HOME 1
    fi
    if [[ $git_change -eq 1 ]]; then
        cd $git_dir
        git commit -m "Update: $argv"
        git push -u origin master
    fi
}

found() {
    place=$1
    maxdepth=$2
    print "MAX $maxdepth"
    results=( ${(f)"$( find $place -maxdepth $maxdepth -iname "*$name*"  )"} )
    print "Not such file: '$name'.\n"
    if [[ -n $results ]]; then
        print "Did you mean:\n"
        for i in $results; {
            print $i
        }
    fi
}

if [[ $action == 'up' || $action == 'down' ]]; then
    for f in $names; do
        $action $f
    done
else
    print "invalid action: $action\n"
    return 1;
fi

