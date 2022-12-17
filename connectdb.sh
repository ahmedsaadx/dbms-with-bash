#!/usr/bin/bash

connect_db(){
     read -p "enter your database name :" -r connect_dbname
    if [ -d $connect_dbname ]; 
    then
    cd $connect_dbname
    select option in 'Create table' 'List tables' "Insert into table" "Delete table" "select from table" "update tables" "back to menu" "exit"
    do
    case $option in 
        "Create table") echo 1 
        ;;
        "List tables") echo 2
        ;;
        "Insert into table") echo 3
        ;;
        "Delete table") echo 4
        ;;
        "select from table") echo 5
        ;;
        "update tables") echo 6
        ;;
        "back to menu") cd .. ; menu
        ;;
        "exit") exit 
        ;;
        *) echo "error"
        ;;
    esac   
    done
    else
    echo "database don't exist "
    menu
    fi  
}
connect_db
