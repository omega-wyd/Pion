##!/bin/bash - 
#===============================================================================
#
#          FILE: wrapper.sh
# 
#         USAGE: ./wrapper.sh 
# 
#   DESCRIPTION: This script controls 6 other scripts written by team Pion. 
# 
#       OPTIONS: ---
#  REQUIREMENTS: -y -e -u -p
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Micheal Brewer (), mbrewerramirez@mail.weber.edu
#  ORGANIZATION: Pion
#       CREATED: 02/15/2017 20:19
#      REVISION:  ---
#===============================================================================

#set -o nounset                  # Treat unset variables as an error


# how the script is suppose to be used.
usage()
{
	echo "Invalid Option"
	echo "Usage: $0 [-y year] [-e email] [-u 'username'] [-p 'passwd']"
	echo " -y -e are required."
	echo "Enter -u and -p for ftp access."
}

close()
{
	./delete.sh
	exit 1
}


# if the user desires to use $0 --help
if [[ $1 == "--help" ]]
	then
	usage
	exit 1
fi

echo
echo "Checking user options and parameters" 

# Getopts while loop
while getopts ":y:e:u:p:" opt
do 
	case $opt in
		y) year=$OPTARG # year to find the appropriate file.
		;;
		e) email=$OPTARG #email to send mail notifications
		;;
		u) user=$OPTARG #username for ftp account
		;;
		p) passwd=$OPTARG # password needed for ftp server.
		;;
		\?) usage
		;;
	esac
done


#IF statement to test if parameters are set. -z checks to see if value is null
if [[ -z $year ]]
then 
	usage
	exit 1
fi

if [[ -z $email ]]
then
	usage
	exit 1
fi

echo
echo "Getting user files by year"

# calling wget.sh with the year
./wget.sh $year


# check scrpt for return code if != 1 then close script and clean files
if [[ $? -ne 0 ]]
then
	close
fi

# Calling expand.sh to expand files.
echo
echo "Expanding files"
./expand.sh 

# check scrpt for return code if != 1 then close script and clean files
if [[ $? -ne 0 ]]
then
	close
fi

# Calling compress.sh to compress new file
echo
echo "Compressing filtered output"
./compress.sh 

# check scrpt for return code if != 1 then close script and clean files
if [[ $? -ne 0 ]]
then
	close
fi

#calling ftp.sh
host="137.190.19.99"
echo
echo "Sending file to FTP server @ $host"
./ftp.sh $user $passwd 

if [[ $? -eq 0 ]]; then
	echo "success"
	echo
	echo "Sending confirmation to $email"
	` mail -s "file transfered " $email <<< "Succesfully transfered file to FTP server at IP $host."`
else
	echo "failed"
fi

#calling delete.sh  
./delete.sh

exit 0
