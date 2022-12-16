#!/usr/bin/bash

create_database(){
   read -p  "enter your database name :" dbname
   regex='A-Za-z'
   if [ -d $dbname ];
   then
    echo "Can't create database $dbname , database exists "
    echo "you can connect with it  "
    echo "back to menu "
    sleep 1
    menu
   else
      if  [[  ! $dbname =~ [^$regex] ]];
      #output of =~ is 0 when regex is matched , 1 otherwise
      then
      mkdir $dbname
      echo "done"
      else 
      echo -e 'your database name must have letters only \nlike mydb , Database '
      
      fi
   fi   



}



create_database
# menu
