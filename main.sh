#!/usr/bin/bash
echo -n "
######################################################
#                                                    #
#      Databasse Management system                   #
#         created BY ahmed                           #
#                                                    #
###################################################### 
"
sleep 1
echo "welcome to Database engine with bash"
menu(){
echo -n "
enter your option
1) Create Database
2) List Database
3) Connect To Database
4) Drop Database
0) Exit 
:" 
read replay
case $replay in 
    1) . ./createdatabase.sh ;sleep 1 ;;
    2) . ./listdatabases.sh
    ;;
    3) . ./connectdb.sh
    ;;
    4) . ./dropdatabase.sh
    ;;
    0) exit 
    ;;
    *) echo 'error'; sleep 1 ;menu;
esac   
}
menu