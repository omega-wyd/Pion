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
host="137.190.19.99" #address
file="$PWD/tmp/outfile.csv" #file to send  DONT know the zip ext


if [[ -z $user ]] && [[ -z  $pass ]]
then
	#use default annonymous
	userd='anonymous'

ftp -n $host <<EOF
quote user $userd
quote pass $pass
put $file
bye
EOF

else

ftp -n $host <<EOF
quote user $user
quote pass $pass
put $file
bye
EOF

fi

exit 0
