#!/bin/bash

# Color
RED='\E[1;31m'
GREEN='\E[1;32m'
DEF='\E[0m'

# Setting
WEB=/home/100336/web/
GIT=/.git
names=( cart.api.shenba.com item.api.shenba.com log.shenba.com oms.shenba.com passports.shenba.com pc.shenba.com seller.shenba.com shenba_api shenba_seller sms.shenba.com cart.shenba.com item.shenba.com m.shenba.com passports.api.shenba.com pc.api.shenba.com pms.shenba.com shenba shenba_local shenba_templates)
#Absolute path to this script
# Params
PAR2=$2

# Warmming Message
for i in "${names[@]}"
do
    if [ -d "$WEB$i" ]; then
	if [ ! -d "$WEB$i$GIT" ]; then
	    echo "$WEB$i 没有GIT"
	fi
    else
	echo "$WEB$i 不存在"
    fi	
done

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
  #git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

parse_git_dirty() {
   git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo 'dirty'
}

parse_git_status() {
   git status -s 2>/dev/null;
}

parse_git_check_branch() {
   git branch -a --no-color 2>/dev/null | grep -w $PAR2 | wc -l
}

function parse_git_fetch {
   git fetch --quiet 2>/dev/null;
}

function parse_git_pull {
   git pull --quiet 2>/dev/null;
}

function parse_git_master {
   git checkout master 2>/dev/null;
}

function parse_git_switch_branch {
   git checkout $PAR2
}

# Check all directly status
function ckall {
for i in "${names[@]}"
do
    # Get in folder
    cd $WEB$i
    bb=$(parse_git_branch)
    dr=$(parse_git_dirty)
    if [ $dr ]; then
	m=$(parse_git_status)
	echo -e "$WEB$i on $RED$bb $GREEN$dr $DEF\n$m"
    else
	echo -e "$WEB$i on $RED$bb $DEF"
    fi
done
}

function ftall {
for i in "${names[@]}"
do
    cd $WEB$i
    msg=$(parse_git_fetch)
    echo "fetching $WEB$i"
    echo "$msg"
done
}

function fpall {
for i in "${names[@]}"
do
    cd $WEB$i
    msg=$(parse_git_pull)
    echo "pulling $WEB$i"
    echo "$msg"
done
}

function ckbranch {
for i in "${names[@]}"
do
    cd $WEB$i
    # a = checkout message
    a=$(parse_git_master)
done

ckall
}

cbranch() {
if [ ! $PAR2 ];then
    echo 'Missage param two'
    exit
fi

for i in "${names[@]}"
do
    cd $WEB$i
    num=$(parse_git_check_branch)
    if [ $num -gt 0 ];then
	msg=$(parse_git_switch_branch)
	echo -e "$WEB$i $GREEN$msg$DEF"
    else
	echo -e "$WEB$i branch $RED$PAR2$DEF not exist"
    fi
done
}

#ckall
#ftall
#ckbranch

# passing arg to shell script
if [ $# -eq 0 ]; then
    echo '-ck | --check > check all paths branch & status'
    echo '-ft | --fetch > fetch all paths branch'
    echo '-fp | --pull > pull all paths branch'
    echo '-cm | --cmaster > checkout all paths to master'
    echo '-cb [branch] | --cbranch > checkout all paths to branch (if branch exist)'
    exit
fi

case "$1" in 
-ck | --check)
    ckall
    ;;
-ft | --fetch)
    ftall
    ;;
-fp | --pull)
    fpall
    ;;
-cm | --cmaster)
    ckbranch
    ;;
-cb | --cbranch)
    cbranch
    ;;
esac
#echo $1 $2 $3 $4
