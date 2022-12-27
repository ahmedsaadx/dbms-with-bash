#!/usr/bin/bash
select_column(){
    echo 'enter your column number :'
    read -r number_
    if  [[  ! $number_ =~ ^[0-9]+$ ]] ;
    then
    echo "error"
    else
    sed -i "$number_ d" $tname
    fi
}
    


select_column2(){
    echo 'enter your start number :'
    read -r num_start
    echo 'enter your end number :'
    read -r num_end
    if  [[ ! $num_start =~ ^[0-9]+$ ]] ;
    then
    echo "error"
    elif  [[ ! $num_end =~ ^[0-9]+$ ]] ;
    then
    echo "error"
    else
    sed -i "$num_start,$num_end d" $tname
    fi
}

echo "enter your table name "
read -r tname
if  ! [ -e $tname -a -e $tname.rows ] ;
then 
echo 'table dont exist '
else
echo "
enter your option
1)  delete all
2) delete by column number
3) delete from line to line 
0) Exit 
:" 
read -r option
case $option in 
    1) sed -i '1,$d' $tname ;;
    2) select_column ;;
    3) select_column2 ;; 
    0) exit ;;             
    *) echo 'error' ;;
esac    
fi 