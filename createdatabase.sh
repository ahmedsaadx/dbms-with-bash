#!/usr/bin/bash

create_database(){
   read -r -p  "enter your database name :"  dbname
   regex='A-Za-z'
   if [[ -d $dbname ]] > /dev/null ;
   then
    echo "Can't create database $dbname , database exists "
    echo "you can connect with it or drop it "
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
      create_database
      fi
   fi   



}



create_database
read -p 'went back to main menu [Y/y , N/n for exit] :' choice_r
case $choice_r in 
   ['Y-y']) menu 
   ;;
   ['N-n']) exit 
   ;;
   *) echo  -e '\nplease enter yes or no only'
   ;;
 esac  
