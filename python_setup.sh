#!/bin/bash

#USE 
#batepy <command code> <arguments>

#MENU

    #COMMAND CODE
    # 1 - install virtual environment
        #ARGS
        #-Name
    # 2 - start venv
        #ARGS
        #-Name
    # 3 - stop venv
        #ARGS
        #-Name        

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
    (sudo apt-get install python3-pip) > log.txt
    (sudo pip3 install virtualenv) >> log.txt
    rm log.txt
    echo "virtualenv installed.\n"    
fi

case $arg1 in 
'1') echo "creating..."
     (virtualenv $arg2) > log.txt
     rm log.txt   
     echo "$arg2 is created."
     ;;
'2') echo "starting $arg2..."
     X=$(pwd)
     gnome-terminal --working-directory='X' -- bash -c "source '$(pwd)/bate/$arg2/bin/activate' > log.txt;rm log.txt; exec bash"   
     echo "$arg2 is activated."
     ;;
esac