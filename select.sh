#!/usr/bin/bash
select_column(){
    echo 'enter your column number :'
    read -r number_
    if  [[ ! $number_ =~ ^['0-9']+$ ]] ;
    then
    echo "error"
    else
    echo -e "\n"
    line=`awk -F: 'BEGIN { ORS=" : " }; { print $1 }' $tname.rows`
    echo $line
    sed -n "$number_ p" $tname
    echo -e "\n"
    fi
}
    


select_column2(){
    echo 'enter your start number :'
    read -r num_start
    echo 'enter your start number :'
    read -r num_end
    if  [[ ! $num_start =~ ^[0-9]+$ ]] ;
    then
    echo "error"
    elif  [[ ! $num_end =~ ^[0-9]+$ ]] ;
    then
    echo "error"
    else
    echo -e "\n"
    line=`awk -F: 'BEGIN { ORS=" : " }; { print $1 }' $tname.rows`
    echo $line
    sed -n "$num_start,$num_end p" $tname
    echo -e "\n"
    fi
}

echo "enter your table name "
read -r tname
if  ! [ -e $tname -a -e $tname.rows 2> /dev/null  ] ;
then 
echo 'table dont exist '
else
echo "
enter your option
1) select all
2) select by column number
3) select from line to line 
0) Exit 
:" 
read -r option
case $option in 
    1) 
    echo -e "\n"
    line=`awk -F: 'BEGIN { ORS=" : " }; { print $1 }' $tname.rows`
    echo $line 
    cat $tname 
    echo -e "\n";;
    2) select_column ;;
    3) select_column2 ;;              
    *) echo 'error' ;;
esac    
fi 