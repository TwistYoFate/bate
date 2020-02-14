#!/bin/bash

# DESCRIPTION :
# This is a bash script to setup following :
# -Python VirtualEnvironment
# -Creating VirtualEnvironment
# -Install python in virtual Environments

# ARGUMENTS :
# if "$1=='1'"
# then "python-virtualenv" will be installed

# if "$2=='1'"
# then new virtual env will be created
# and it's name will be "$3"

arg1="${1:-0}"
arg2="${2:-'newenv'}"

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' virtualenv|grep "install ok installed")
if [ "" == "$PKG_OK" ]
then
    echo "Python Virtual Environment not found, setting it up right now...\n\n"
    (sudo apt-get install python-virtualenv) > log.txt
    rm log.txt
    echo "virtualenv installed.\n"    
fi

if [ "$arg1"==1 ] 
then echo "creating..."
     (virtualenv $2) > log.txt
     rm log.txt   
     echo "$2 is created."
fi