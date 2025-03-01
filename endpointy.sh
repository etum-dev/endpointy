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


#default values:
url=unset
dir="/tmp"
mode="lightweight"
branch="main"

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
Heavyweight () {
    echo "wip"
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
    -d | --dir) dir=$2; shift ;;
    # mode could be a bool
    -m | --mode) mode=rty ; shift ;;
    -b | --branch) xy=z ; shift ;;
    -u | --url) url=$2 ; shift ;;

    esac
echo $ARGS


# static when testing git clone --depth 1 --no-checkout --filter=tree:0 https://github.com/nilsteampassnet/TeamPass
#url=https://github.com/nilsteampassnet/TeamPass
Lightweight
Cleanup