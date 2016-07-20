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
Assumption is the keys were generated to the id_rsa1
cat ~/.ssh/id_rsa1.pub

On the Linux do the following after
ssh-agent
ssh-add ~/.ssh/id_rsa1 (assuming the rsa was stored in the id_rsa1.pub) 






Process to check in files
-------------------------

Do git status to see what are the files that need to be pushed
Do git add <file> for all the files that needs to be checked in
Do git commit -m "Message"
Do git push -u origin master



