#!/usr/bin/bash
create_database(){
   read -r -p  "enter your database name :"  dbname
   regex='A-Za-z'
   if [[ -f $dbname ]] > /dev/null ;
   then
    echo "Can't create database $dbname because file have same name  "
    sleep 1
    menu
   fi
   if [[ -d $dbname ]] > /dev/null ;
   then
    echo "Can't create database $dbname , database exists "
    echo "you can connect with it or drop it "
    echo "back to menu "
    sleep 1
    menu
   else
      if  [[ $dbname =~ ^[$regex]+$ ]];
      then
      mkdir $dbname 2> /dev/null
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
