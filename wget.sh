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
	echo "Usage: $0 [year1] [year2]"
}

# Check for help call
if [[ $1 == "--help" ]]
then 
	usage
	exit 1
fi


year1=$1
address="icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$year.tar.gz"

wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$1.tar.gz
wget $address 



exit 0

