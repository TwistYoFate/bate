#!/bin/bash


#Add aliases in the 'set_local_vars' function below
set_local_vars(){
    #saaf
    #purpose:testing
    #to remove all venv files
    alias saaf='rm -r -v !(my_var.sh|python_setup.sh) > log.txt; rm log.txt; echo Cleaned!';
    
    #setpy
    #purpose : production
    alias setpy='. ./python_setup.sh';
    
}
set_local_vars
echo "LOCAL VARIABLES LOADED !"    