#!/usr/bin/bash
connect_db(){
     read -p "enter your database name :" -r connect_dbname
    if [ -d $connect_dbname ]; 
    then
    cd $connect_dbname
    PS3=$(echo  -e "current database : $(pwd|cut -d '/' -f 5)\nPlease enter your choice": )
    select option in 'Create table' 'List tables' "Insert into table" "Delete table" "select from table" "delete from table" "update tables" "back to menu" "exit"
    do
    case $option in 
        "Create table") . ../createtable.sh
        ;;
        "List tables") . ../tableslist.sh
        ;;
        "Insert into table") . ../insert.sh
        ;;
        "Delete table") . ../deletetable.sh
        ;;
        "select from table") . ../select.sh
        ;;
        "update tables") . ../update.sh
        ;;
        "delete from table") . ../dropfromtable.sh 
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
