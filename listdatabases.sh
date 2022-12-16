#!/usr/bin/bash 
declare -a lists
list(){
  dir=`ls -l | grep '^d' |cut -d' ' -f9`
  for i in $dir 
  do 
  lists=(${lists[@]} $i)
  done 
}  

 check (){
    if (( "${#lists[@]}" == 0 )) ;
  then
    echo -e '\nno there databases yet\nyou can create new database \nDo you want to create? :'
    select answer in 'yes' 'no'
    do 
     case $answer in 
       "yes") . ./createdatabase.sh ;exit
       ;;
       "no") exit ;;
       
       *) echo "please answer with Y/N " 
       ;;
    esac    
    done
      
  else 
     echo $i
     
   fi  
 }
 list
 check

read -p 'went back to main menu [Yy , Nn for exit] :' choice
case $choice in 
   ['Y-y']) menu 
   ;;
   ['N-n']) exit 
   ;;
   *) echo  -e '\nplease enter yes or no only \n\nyour databases list again: \n' ;check;;
esac
 
