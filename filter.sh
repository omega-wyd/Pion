#!/bin/bash - 
#===============================================================================
#
#          FILE: filter.sh
# 
#         USAGE: ./filter.sh 
# 
#   DESCRIPTION: Filters data from $PWD/tmp/output.csv and other .csv files 
#				 doesnt get header data
#				 retrieves only Canadian female residents
#				 takes NULL emails and replaces with dummy address: waldo@weber.edu
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: DAVID MARILUCH (), davidmariluch@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/15/2017 04:53
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# help function
help()
{
	echo "Usage: this script is executed inside expand.sh (e.g ./expand.sh)"
}

# check for --help call as 1st parameter
if [[ $1 == "--help" ]]
then
	help
	exit 1
fi

# csv file structure from $file input
# id, first_name, last_name, email,gender,country

file=$1
awksrc="$PWD/filter.awk"
output="$PWD/tmp/outfile.csv"

echo "Filtering $file by female Canadian residents"
echo "Appending users to $output"

# awk to take values and append it to new output file
awk -f $awksrc $file >> $output


exit 0

