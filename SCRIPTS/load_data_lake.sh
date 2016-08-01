#!/bin/bash


DIR="CSV_FILES" 


if [ -d "$DIR" ]
then
	echo "$DIR directory  exists!"
	rm -rf $DIR
else
	echo "$DIR directory not found!"
fi
mkdir $DIR

cd $DIR

echo
echo
backup="backup"
if [ -d "$backup" ]
then
	echo "$backup directory  exists!"
else
	echo "$backup directory not found!"
	mkdir $backup
fi

echo
echo
rn_backup="rn_backup"
if [ -d "$rn_backup" ]
then
	echo "$rn_backup directory  exists!"
else
	echo "$rn_backup directory not found!"
	mkdir $rn_backup
fi

echo "Renaming the files to remove blank spaces and replacing with _" 
echo
echo
ls ../../DATASETS/*csv > temp
ls ../../DATASETS/GDP_Metro/*csv >> temp
ls ../../DATASETS/GDP_State/*csv >> temp
ls ../../DATASETS/IRSIndex/*csv >> temp
ls ../../DATASETS/Georelations/*csv >> temp
while read file
do
	cp -rf "$file" .
	cp -rf "$file" $backup
        new_fname=`echo $file | tr " " "_"`
        echo Moving $file $new_fname
        mv -f "$file" $new_fname
	cp -rf $new_fname $rn_backup
done < temp
rm temp

echo
echo
echo "We are going to remove the headers"
ls *csv > temp
while read file
do
	echo "Removing Headers for $file"
	tail -n +2 $file > temp1
	mv -f temp1 $file
done < temp
rm temp
echo
echo

echo
echo
echo "Move these files into HDFS"
hdfs dfs -mkdir /user/w205/PROJ
ls *csv > temp
while read file
do
	echo "Moving $file to HDFS"
	hdfs dfs -put $file /user/w205/PROJ
done < temp
rm temp
echo
echo

echo "Copying the extract_header.pl to renamed backup directory"
cp ../extract_header.pl $rn_backup

echo "Please run the $DIR/$rn_backup/extract_header.pl in the $DIR/$rn_backup Directory"
echo "Copy the hive_base_ddl.sql to whereever you want and run hive -f hive_base_ddl.sql"

cd ..


