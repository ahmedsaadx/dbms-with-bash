#!/usr/bin/bash
echo "enter table name :"
read -r deleted_table
if [ -e $deleted_table ];
then
  rm $deleted_table $deleted_table.rows
  echo "table deleted"
else
   echo "file dont exist"
 fi    