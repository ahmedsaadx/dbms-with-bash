#!/usr/bin/bash
update_(){
    echo "enter your column name :"
    read -r column_
    col_num=`awk 'END{print NR }' $tname.rows`
    i=1
    while(( $i <= $col_num ))
    do
    vaild_column_name=`awk -F : '{if ( NR == '$i') print $1 }' $tname.rows`
    if [ $column_ == $vaild_column_name 2> /dev/null ];
    then
        column_type=`awk 'BEGIN {FS=":"}{if ( NR=='$i' ) print $3 }' $tname.rows`
        column_pk=`awk 'BEGIN {FS=":"}{if ( NR=='$i' ) print $2 }' $tname.rows`
        echo "enter your new value :"
        read -r value_
        if [ -z $value_ ];
        then
        echo 'value must not be empty'
        exit
        elif [ $column_pk = 'yes' ];
        then
        ahmed=`awk -v var=$i -F : 'BEGIN{ORS=" "} {print $var}' $tname`
        for ii in $ahmed
                do
                    if [ $value_ = $ii ];
                    then
                        echo "invalid input (pk must be unqiue)"
                        exit 
                     fi      
                done
 
        fi
        echo "enter your old value"
        read -r oldvalue
        
        if [ $column_type = 'int' 2> /dev/null ];
        then
            if [[ ! $value_ =~ ^[0-9]+$ ]];
            then
                echo " error enter numbers only"
            else    
            ahmed=`awk -v var=$i -F : 'BEGIN{ORS=" "} {print $var}' $tname`
                for ii in $ahmed
                do
                    if [ $oldvalue == $ii  ] 
                    then
                        sed -i 's/'$oldvalue/$value_'/'  $tname
                        break
                     fi   
                done
            fi
        elif [ $column_type = 'str' 2> /dev/null ];
        then
            if [[ ! $value_ =~ ^[A-Za-z]+$ ]];
            then
                echo " error enter char only"
            else   
            ahmed=`awk -v var=$i -F : 'BEGIN{ORS=" "} {print $var}' $tname`
                for ii in $ahmed
                do
                    if [ $oldvalue = $ii 2> /dev/null ];
                    then
                        sed -i 's/'$oldvalue/$value_'/'  $tname
                        break
                     fi      
                done
                fi 
       
            
                
        fi
        

    fi
    
    i=$(( $i + 1 ))
    done
}



echo "enter table name : "
read -r tname
if [[ -e $tname ]];
then    
    update_
else
   echo "table don't exist "
fi









