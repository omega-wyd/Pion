#!/bin/bash - 
#===============================================================================
#
#          FILE: compress.sh
# 
#         USAGE: ./compress.sh 
# 
#   DESCRIPTION: This script will compress the final filter file using zip.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Mashael Al Abbad (), malabbad1@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/15/2017 04:53
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# Help function
help ()
{
	echo "Usage ./compress.sh"
	echo "compress the final filter file using zip"
}

# Check for help call
if [[ $1 == "--help" ]]
then
	help
	exit 1
fi

# Compress the final filter file using zip 
# Rename it with MOCK_DATA_FILTER_YYYY_MM_DD_HH:MM.zip
date=`date +%Y_%m_%d_%H:%M`
theFile=MOCK_DATA_FILTER_$date.zip

echo "Zipping up new file"
dir="$PWD/tmp/outfile.csv"
zip $PWD/$theFile $dir

exit 0

