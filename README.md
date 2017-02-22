
Homework Assignment 4 Group Project  Pion
  Authors: [Micheal Brewer](https://github.com/omega-wyd) , [David Mariluch](https://github.com/damooch), [Mashael Al Abbad](https://github.com/Mashael2)
  CS 3030 &ndash; Hugo Valle
 


# --------------------  WRAPPER  -------------------- #
wrapper.sh :
`wrapper.sh` combines the `compress.sh`  `expand.sh`   `filter.sh` `wget.sh`
`delete.sh`    `filter.awk`  `ftp.sh` and `tar.sh` files.
 12 
 13 ```bash
 14 $ ./wrapper.sh -y <year1,year2> -e <email> -u <username> -p <password>
 15 ```



# --------------------  WGET  -------------------- #
wget.sh :
	this script is called with ./wget.sh
	the script pulls files with wget.
	
	The script starts with a help funciton that can be called with --help as param one.
	```
	Usage: ./wget.sh [year1] [year2]
	```
	!!!! (Needs to do the checking for 2015 and 2016 inside of this) !!!!
	!!!! (Also needs status messages echod) !!!!

# --------------------  EXPAND  -------------------- #

expand.sh :
	this script is called with ./expand.sh
	the script Expands compressed tar files in the working directory by decompressing them
	and putting their contents into the tmp directory in the current working directory

	The script begins with a help function if someone calls script with --help as 1st parameter
	Next the script checks to see if the /tmp directory exists in $PWD if it doesnt then it is created
	Then a for loop checks the filename of all files ending in .tar.gz wiithin $PWD 
		each file is decompressed and their contents are exproted to the path $PWD/tmp
	Last the script loops over all the files in $PWD/tmp ending in .csv
		the loop calls +x script filter.sh with ./filter.sh $file where the current .csv file is passed as 
		a parmeter

# --------------------  FILTER  -------------------- #

filter.sh :
	this script is called inside expand.sh with ./filter.sh $file (file is passing current .csv file as param)
	the script filters data from Filters data from $PWD/tmp/*.csv files
	doesnt get header data
.   	retrieves only Canadian female residents
	takes NULL emails and replaces with dummy address: waldo@weber.edu
	then outputs the data to $PWD/tmp/outfile.csv

	The script begins with a help function if someone calls script with --help as 1st parameter
	Then the script calls awk -f awksrc inputfile
	The awksrc file is in $PWD/filter.awk
		The awksrc file filters data by Canadian Females and prints the firstname, lastname, and email fields
		If the email field is NULL or empty string it replaces it with a dummy address waldo@weber.edu
	Last the filtered information is output to $PWD/tmp/output.csv

# --------------------  COMPRESS  -------------------- #

compress.sh :
     This script is called with ./compress.sh 

	 The scipt begins with a help function so if someone calls the script with --help as 1st parameter
	 This scripts will compress the final filter file using zip and then rename it with: MOCK_DATA_FILTER_YYYY_MM_DD_HH:MM.zip


# --------------------  FTP  -------------------- #

ftp.sh :
	This script is called with ./ftp $user $pass

	the script starts by finding the local zip file with filtered data in it and stores it into a variable

	then the script takes in two parameters and evaluates if they are empty

	if they are empty the script will set the user to anonymous and pass in an empty password
	this will make the script use a default ftp protical, change the default dir to MockData, and store the local file that has been zipped to a default file in the local student server /srv/usr/MockData

	if they are not empty the script uses the users credentials to log into the server and store the file that has been zipped to their /home/ directory

# --------------------  DELETE   -------------------- #

delete.sh :
      This script is called with ./delete.sh

	  The script begins with a help function if someone calls the script with --help
	  This script will clean everything, and delete the temp folder with all the files.
