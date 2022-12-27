#!/usr/bin/bash 
declare -a lists
list(){
  dir=`ls -F | grep '/' |cut -d'/' -f1`
  for i in $dir 
  do 
  lists=(${lists[@]} $i)
  
  done 
}  

 check (){
    if [ ${#lists[@]} == 0 ] ;
  then
    echo -e '\nno there databases yet\nyou can create new database \nDo you want to create? :'
    select answer in 'yes' 'no'
    do 
     case $answer in 
       "yes") . ./createdatabase.sh ;menu;;
       "no") echo "back to menu ";sleep 1 ; menu;;
       
       *) echo "please answer with 1,2 " 
       ;;
    esac 
    done
    else  
    echo ${lists[@]}   
   fi  
 }
 list
 check
 

read -p 'went back to main menu [Y/y , N/n for exit] :' choice
case $choice in 
   ['Y-y']) menu 
   ;;
   ['N-n'])echo ${lists[@]}; exit 
   ;;
   *) echo  -e '\nplease enter yes or no only \n\nyour databases list again: \n' ;echo ${lists[@]};;
esac
 
