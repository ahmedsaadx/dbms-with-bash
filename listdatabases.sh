#!/usr/bin/bash 
list(){
  dir=`ls -l | grep '^d' |cut -d' ' -f9`
  for i in $dir 
  do 
  lastlist=(${lastlist[@]} $i)
  echo $i
  done 
}
list
read -p 'went back to main menu [Yy , Nn for exit] :' choice
case $choice in 
   ['Y-y']) menu 
   ;;
   ['N-n']) exit 
   ;;
   *) echo  -e '\nplease enter yes or no only \n\nyour databases list again: \n' ;list;;
esac
 
