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
file=$(find ./ -name "MOCK_DATA_FILTER_*.zip") #fle to send  DONT know the zip ext

echo "checking for user and pass"

if [[ -z $user ]] && [[ -z  $pass ]]
then
	echo "user and pass not provided, sending as annonymous"
	#use default annonymous
	userd='anonymous'

ftp -n $host <<EOF
quote user $userd
quote pass $pass
cd MockData
put $file
bye
EOF

else

	echo "Logging into ftp server as $user"
ftp -n $host <<EOF
quote user $user
quote pass $pass
put $file
bye
EOF

fi

exit 0
