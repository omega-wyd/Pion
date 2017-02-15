#!/usr/bin/awk -f
#file.awk
# awk src file that filters data by Female and Canada then outputs firstname lastname and email
# and if email is NULL or empty string replaces it with default email waldo@weber.edu

BEGIN {FS=","}
{
	if($5 == "Female" && $6 == "Canada")
	{
		if($4 == "NULL" || $4 == "")
		{
			print $2", "$3", waldo@weber.edu"
		}
		else
		{
			print $2", "$3", "$4
		}
	}
}
