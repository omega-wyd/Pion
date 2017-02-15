# Pion

# --------------------  WRAPPER  -------------------- #




# --------------------  WGET  -------------------- #




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
		each file has awk take the 2nd 3rd and 4th parameter which are fname, lname, and email respectively
		and appends the values to a new comma seperated csv output file in $PWD/tmp/outfile.csv


# --------------------  FILTER  -------------------- #




# --------------------  COMPRESS  -------------------- #




# --------------------  FTP  -------------------- #




# --------------------  DELETE   -------------------- #

