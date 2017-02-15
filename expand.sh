#!/bin/bash - 
#===============================================================================
#
#          FILE: expand.sh
# 
#         USAGE: ./expand.sh 
# 
#   DESCRIPTION: Expand passed tar files
#				 0) take in tar files and check for params
#				 1) Create temp folder to expand to
#				 2) Loop files to expand and retrieve first, last and email columns
#				 3) Create a new output file with columns
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: DAVID MARILUCH (), davidmariluch@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/15/2017 01:25
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# Help function with script usage
help ()
{
	echo "Usage ./expand.sh [fileName1.tar.gz] [fileName2.tar.gz] [etc...]"
	echo "Script can take any # of compressed tar files as params"
}

# Check for help call
if [[ $1 == "--help" ]]
then
	help
	exit 1
fi

# Check if directory exists
dir="$PWD/tmp"
if [[ ! -d $dir ]]
then
	mkdir -p $dir
fi

# For each compressed file passed as param expand into $PWD/tmp
for filename in *.tar.gz
do
	tar -zxvf $filename -C $dir 
done

# Loop over files in tmp
outfile="outfile.csv"
for file in $dir/*.csv
do
	# awk to take values and append it to new output file
	awk -F, '{print $2", "$3", "$4}' $file >> $dir/$outfile
done

exit 0

