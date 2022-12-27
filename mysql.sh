#!/usr/bin/bash
query_run(){
    read -p "enter your query " -r query
    mysql --defaults-extra-file=.my.cfg  -e "$query" 2> .sql.log
    if [ $? != 0 ];
    then
    echo 'error'
    else
    echo 'done'
    fi

}
touch .sql.log
mysql --version &> /dev/null
if [ $? != 0 ];
then
echo "mysql or mariaDb should installed before run this script "
else
 read -p "enter your Database Username :" -r username
 read -p "enter yor database password " -r -s password 
 echo "[client]" > .my.cfg
 echo "user=$username" >>.my.cfg
 echo "password=$password">> .my.cfg

fi
 echo -e "\n"
select  i in 'Run Query' 'exit'
do
case $i in 
    'Run Query') query_run 
    ;;
    'exit') exit ;;
    *) echo 'error'
    ;;
 esac   
    
   
done 
# echo  -n  "enter your Database query (0 for exit):" 
#     read -r $query
#      if [[ $query == 0 ]];
#     then
#         break
#     fi
   
#     echo -n "$query " > .sql.sql
#     mysql   <.sql.sql >.sql.log
#     echo -e "\n"
#     cat .sql.log
#     echo -e "\n"
#     if [ $? != 0 ];
#     then
#     echo 'error'
#     else
#     echo 'done'
#     fi
