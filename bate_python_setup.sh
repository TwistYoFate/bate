#!/bin/bash

# DESCRIPTION :
# This is a bash script to setup following :
# -Python VirtualEnvironment
# -Creating VirtualEnvironment
# -Delete VirtualEnvironment

# OUT OF SCOPE
# -Install python in virtual Environments

# USE 
# batepy <COMMAND_CODE> <ARGS>

# MENU

#     COMMAND_CODE
#     1 - Create virtual environment
#         ARGS
#             -Name
#     2 - Start specified(passed as second argument) virtual environment
#         ARGS
#             -Name
#     3 - Stop specified(passed as second argument) virtual environment
#         ARGS
#             -Name        

arg1="${1:-'0'}"
arg2="${2:-'newenv'}"

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' virtualenv|grep "install ok installed")
if [ "" == "$PKG_OK" ]
then
    echo "Python Virtual Environment not found, setting it up right now..."
    echo ""
    (sudo apt-get install python3-pip)
    (sudo apt install python-pip) 
    (sudo apt install virtualenv) 
    echo "virtualenv installed."
    echo ""    
fi

case $arg1 in
'0') echo "HELP"
     less bate_python_help.txt
     ;;
'1') echo "creating..."
     (virtualenv $arg2) > log.txt
     rm log.txt   
     echo "$arg2 is created."
     ;;
'2') echo "starting $arg2..."
    #------------------------------------------------------------------#gnome-terminal --working-directory='$(pwd)' -- bash -c "
    source "$arg2/bin/activate"
    #------------------------------------------------------------------# ; exec bash"  
     echo "$arg2 is activated."
     ;;
'3') echo "delete $arg2..."
     rm -r $arg2 > log.txt
     rm log.txt
     echo "$arg2 deleted."     
esac