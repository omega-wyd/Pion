#!/bin/bash - 
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
	echo "Usage: $0 [-y year1,year2] [-e email] [-u username] [-p passwd]"
	echo " -y -e are required."
	echo "Enter -u and -p for ftp access."
	exit 1
}

# if the user desires to use $0 --help
if [[ $1 == "--help" ]]
then
	usage
fi


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
		\?)
			usage
			;;
	esac
done


#IF statement to test if parameters are set. -z checks to see if value is null
if [[ -z $year ]] || [[ -z $email ]]
then 
	usage
fi


# divide the substring of year and save each year to a variable.

IFS=, read year1 year2 <<< $year

#check to see if year is 2015 or 2016
if [[ $year1 != 2015 ]] # || [[ $year2 != 2015 ]]
then
	echo "needs to be 2015 or 2016"
fi

if [[ $year2 != 2016 ]] # || [[ $year1 != 2016 ]]
then
	echo "needs to be 2015 or 2016"
fi

# Calling wget.sh
./wget.sh $year1 $year2 |
# Calling expand.sh to expand files.
./expand.sh |
# Calling filter.sh 
./filter.sh




#mail -s "file transfered " $email <<< "Succesfully transfered file to FTP  server"<br>




exit 0

