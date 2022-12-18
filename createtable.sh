#!/usr/bin/bash
item(){
  echo "enter your "



}




read -p "enter your table :" -r table_name
regex_1="A-Za-z"
if [[ $table_name =~ [^$regex_1] ]];
then
  echo 'your table name must have letters only '
else
  if [ -e $table_name ];
  then
   echo 'table is existed'
   echo "back to connected DB menu "
  else
  touch  $table_name
  echo "table created"
  echo "back to connected DB menu "
  fi 
fi
