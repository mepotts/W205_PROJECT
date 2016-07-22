                                        README
                                        ------

This repo contains the PROJECT for w205

In order to clone the repo do the following
1.  In the user account (or create a directory which you created for the project), type the command

git clone https://github.com/ganeshsberkeley/W205_PROJECT

git pull

Also edit the .git/config to change the following line to

url = ssh://git@github.com/ganeshsberkeley/W205_PROJECT

Key Generation
--------------
Generate ssh keys

ssh-keygen -t rsa -C ganeshsberkeley@github.com

ssh-copy-id ganeshsberkeley@github.com

Copy the keys to the github (logon on to git hub, select the repo, click on settings, click on deploy keys, and add the keys there)
Assumption is the keys were generated to the id_rsa

cat ~/.ssh/id_rsa.pub

On the Linux do the following after

ssh-agent

ssh-add ~/.ssh/id_rsa (assuming the rsa was stored in the id_rsa.pub) 






Process to check in files
-------------------------

Do 

git status to see what are the files that need to be pushed

git add <file> for all the files that needs to be checked in

git commit -m "Message"

git push -u origin master

The following scripts are to be used for the project to create tables for hive
1.  cd SCRIPTS
2.  ./load_data_lake.py -> It will create all the files needed for loading the csv files to hdfs and load them
3.  cd CSV_FILES/rn_backup
4.  ./extract_header.pl -> It will create the sql headers for sql tables
5. hive -f hive_base_ddl.sql -> Load all the tables into hive

Now we are ready to connect to tableau
6.  hive --service hiveserver2 -> To start hive server

Now move on to tablueau to do all the work



