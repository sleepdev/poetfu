#!/bin/sh

#requires that the user create a rsa public key at ~/.ssh/id_rsa.pub
if [ ! -f ~/.ssh/id_rsa ]
then 
   echo 'save generated key file at ~/.ssh/id_rsa'
   ssh-keygen -t rsa
fi

ssh root@$1 'mkdir ~/.ssh ; touch ~/.ssh/authorized_keys'
cat ~/.ssh/id_rsa.pub | ssh root@$1 'cat >> ~/.ssh/authorized_keys'

#based on solution from http://linuxproblem.org/art_9.html
