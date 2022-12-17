#!/usr/bin/bash
drop_function(){  
   read -p  "enter your database name :" -r dropd
   rm -r $dropd 2> /dev/null
   if [ $? = 0 ];
   then 
   echo "database droped"
   else
   echo "Database don't exist "
    
      
   fi
}

drop_function
read -p 'went back to main menu [Y/y , N/n for exit] :' choice_d
case $choice_d in 
   ['Y-y']) menu 
   ;;
   ['N-n']) exit 
   ;;
   *) echo  -e '\nplease enter yes or no only'
    ;;
 esac  
