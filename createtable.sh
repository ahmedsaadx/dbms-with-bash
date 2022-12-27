#!/usr/bin/bash
declare -a list
regex_num='0-9'
regex1='A-Za-z'
col_name(){
    echo "enter coiumn name: "
    read -r col_name    
    if [[ ! $col_name =~ ^[$regex1]+$ ]];
    then
        echo "column have charaters [A-Za-z] only "
        rm $table_name $table_name.rows
        exit 0
    else
        echo "done"
        list=( ${list[@]} $col_name)   
     fi              
}

clo_PK(){
    echo "this column is primary key or not [yes/no] :"
        read PK
        case $PK in 
             Yes|Y|y) list=(${list[@]}':yes')
             col_type;;
             NO|N|n) list=(${list[@]}':no')
             col_type;;
             *)echo 'error[must be yes or No]';rm $table_name $table_name.rows; exit 0
             ;;
        esac
}

col_type(){
    read -p "what is column type [int/i ,str/s] : " column_type
        case $column_type in 
             int|i) list=(${list[@]}":int")
             ;;
             str|s) list=(${list[@]}":str")
             ;;
              *)echo "error[must be int/str]";rm $table_name $table_name.rows; exit 0  
             ;;
        esac

}
read -p "enter your table :" -r table_name
if [[ ! $table_name =~ ^[$regex1]+$ ]];
then
  echo 'error(your table name must have letters only) '
elif [ -e $table_name ];
  then
   echo 'table is existed'
   echo "back to connected DB menu "
else
    echo "enter your columns number :"
    read -r col_num
    if [[ ! $col_num =~ ^[$regex_num]+$ ]];
      then
      echo "column must be num only "
    else
    touch  $table_name $table_name.rows
      i=0
      while ((i < $col_num))
      do
        col_name
        clo_PK
        i=$(( $i + 1 )) 
      done
      echo   ${list[@]} | tr " " "\n "> $table_name.rows 
      fi   
  
  
    
  
  fi 
  


