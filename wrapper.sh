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
	echo "Usage: $0 [-y year1,year2] [-e email] [-u 'username'] [-p 'passwd']"
	echo " -y -e are required."
	echo "Enter -u and -p for ftp access."
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
if [[ -z $year ]] && [[ -z $email ]]
then 
	usage
	exit 1
fi

echo
echo "Getting user files by year"

# divide the substring of year and save each year to a variable.
for var in $(echo $year | sed "s/,/ /g")
do
	./wget $var
done

# Calling expand.sh to expand files.
echo
echo "Expanding files"
./expand.sh 

# Calling compress.sh to compress new file
echo
echo "Compressing filtered output"
./compress.sh 

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
echo
./delete.sh
echo "Removed directory $PWD/tmp" 

exit 0
