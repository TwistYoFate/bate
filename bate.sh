#!/bin/bash


#Add aliases in the 'set_local_vars' function below
set_local_vars(){
    #saaf
    #purpose:testing
    #to remove all venv files
    alias saaf='rm -r -v !(bate*) > log.txt; rm log.txt; echo Cleaned!';
    
    #setpy
    #purpose : production
    alias batepy='. ./bate_python_setup.sh';

    #source-util
    alias venv_activate='source bate/$arg2/bin/activate; exec bash';  
    
}
set_local_vars 
echo "WELCOME TO BATE !!"
echo ""
echo "Type 'batepy 0' to get started."
echo ""   