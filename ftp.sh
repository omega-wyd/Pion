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
ftp_success_msg="226 Transfer Complete"
ftplog=$PWD/tmp/ftplogfile

echo "checking for user and pass"

if [[ -z $user ]] && [[ -z  $pass ]]
then
	echo "user and pass not provided, sending as annonymous"
	#use default annonymous
	userd='anonymous'

	ftp -nv $host <<EOF > $ftplog
	quote user $userd
	quote pass $pass
	cd MockData
	put $file
	bye
EOF

	grep "230 Login successful" $ftplog
	grep "226 Transfer complete" $ftplog
	rc=$?

	if [[ $rc -eq 0 ]]
	then
		echo "ftp OK"
	else
		echo "ftp Error"
		exit 1
	fi

else

	echo "Logging into ftp server as $user"
	ftp -nv $host <<EOF > $ftplog
	quote user $user
	quote pass $pass
	put $file
	bye
EOF

	grep "230 Login successful" $ftplog
	grep "226 Transfer complete" $ftplog
	rc=$?

	if [[ $rc -eq 0 ]]
	then
		echo "ftp OK"
	else
		echo "ftp Error"
		exit 1
	fi

fi

exit 0
