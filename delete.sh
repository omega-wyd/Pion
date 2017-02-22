#!/bin/bash - 
#===============================================================================
#
#          FILE: delete.sh
# 
#         USAGE: ./delete.sh 
# 
#   DESCRIPTION: Delete the temp folder with all the files.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Mashael Al Abbad (), malabbad1@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/14/2017 20:27
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# Help function
help ()
{
	echo "Usage ./delete.sh"
	echo "Delete the temp folder with all the files"
}

# Check for help call
if [[ $1 == "--help" ]]
then
	help
	exit 1
fi

echo
echo "Cleaning up.."

mv *.zip tmp
mv *.tar.gz tmp

for file in $PWD/tmp/*
do
	rm $file
done

rmdir tmp
if [[ $? -eq 0 ]]
then
	echo "Removed directory $PWD/tmp"
fi

exit 0

