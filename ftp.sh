#!/bin/bash - 
#===============================================================================
#
#          FILE: ftp.sh
# 
#         USAGE: ./ftp.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: 
#  ORGANIZATION: WSU
#       CREATED: 02/15/2017 04:53
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error


user=$1
pass=$2
HOST=' @icarus.cs.weber.edu ' #address
FILE='/$PWD/temp/outfile.csv ' #file to send  DONT know the zip ext




if [[ ! -z $1 ]] && [[ !-z  $2 ]]
then
#use pass and username

`ftp -n $HOST << END_SCRIPT
quote USER $user
quote PASS $pass
binary
put $FILE
quit
END_SCRIPT`

else

#use annonymous 






exit 0

