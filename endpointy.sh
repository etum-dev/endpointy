#!/usr/bin/env bash

#// lightweight mode (default):
#// git ls-remote --heads <repo-url>
#// cd <folder>
#// git ls-tree -r --name-only <branch-name> (main || master)
#// edge case: Dubious folder error.
#
#// heavy mode:
#// git clone into specified folder
#// take file structure as well as run checks in the code for certain strings.




Lightweight () {
    echo "fetching git repo (o｡･･｡)o"
    rhead=$(git clone --depth 1 --no-checkout --filter=tree:0 $url)
    reponame=${url##*/}
    echo "$reponame get! +.(ﾉ*･ω･)ﾉ*."
    # move to the cloned folder ..
    cd $reponame
    # get the main || master branch name
    heads=$(git ls-remote --heads $url)
    
    echo $heads
    # list the tree
}
Cleanup () {
    echo "Removing repo"
    cd ..
    rm -frfr $reponame
}
Help () {
    echo -e 'Usage: \n'
    echo -e '-u url'
    echo -e '-d  out dir (default /tmp)'
    echo -e '-m  mode'
    echo -e '-b branch name (default main)'
}
ARGS=$(getopt -a -o "dmbu:" -l "url:,dir,mode,branch" -- "$@")
VALIDARGS=$?
echo $VALIDARGS

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    Help
fi

if [ $VALIDARGS != 0 ]; then
echo "No valid args supplied"
    Help
fi

case "$1" in 
    -d | --dir) asd=qwe ; shift ;;
    -m | --mode) qwe=rty ; shift ;;
    -b | --branch) xy=z ; shift ;;
    -u | --url) url=$url ; shift ;;

    esac


# static when testing git clone --depth 1 --no-checkout --filter=tree:0 https://github.com/nilsteampassnet/TeamPass
#url=https://github.com/nilsteampassnet/TeamPass
##Lightweight
#Cleanup