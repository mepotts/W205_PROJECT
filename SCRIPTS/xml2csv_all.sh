#!/bin/bash

echo "copying xml files"

IFS=","
t=""
for i in {1..1000}  
do
	read f1 f2 f3 f4 f5
	if [ "$f4" != "" ]
	then
	   echo "URL :$f4"
	   wget $f4
  
	fi
    
done < index_0.csv
echo "running xml2csv_all.py script"
python xml2csv_all.py

echo "deleting xml files"
rm *.xml