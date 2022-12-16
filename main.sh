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
menu(){
echo -n "
welcome to Database engine with bash
enter your option
1) Create Database
2) List Database
3) Connect To Database
4) Drop Database
0) Exit 
:" 
read replay
case $replay in 
    1) . ./createdatabase.sh
    ;;
    2) echo 2
    ;;
    3) echo 3
    ;;
    4) echo 4
    ;;
    0) exit 
    ;;
    *) echo 'error'; sleep 1 ;menu;
esac   
}
menu