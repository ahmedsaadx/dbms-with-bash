#!/usr/bin/bash
drop_function(){
   echo "enter your database name :"
   read dropd
   rm -r $dropd
}

drop_function