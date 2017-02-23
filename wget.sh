#!/bin/bash - 
#===============================================================================
#
#          FILE: wget.sh
# 
#         USAGE: ./wget.sh 
# 
#   DESCRIPTION: This script is meant to retrive two files based on the
# 					input parameter.
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Micheal Brewer II Email: mbrewerramirez@mail.weber.edu
#  ORGANIZATION: Pion
#       CREATED: 02/15/2017 04:54
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error


#help function with script usage

usage()
{
	echo "this script is called from the wrapper.sh."
	echo "Usage: ./wrapper.sh -y [year1,year2,etc] -e [email] -u [user] -p [password]"
}

# Check for help call
if [[ $1 == "--help" ]]
then 
	usage
	exit 1
fi

year=$1


if [[ $year -eq 2015 ]]
then
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$year.tar.gz
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_2016.tar.gz
else
 echo $0 "year input parameter must be either 2015 or 2016."
fi

if [[ $year -eq 2016 ]] 
then
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$year.tar.gz
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_2015.tar.gz
else
 echo $0 "year input parameter must be either 2015 or 2016."
fi




exit 0

