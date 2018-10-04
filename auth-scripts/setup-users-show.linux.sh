#!/bin/bash

# Huristic: find "recent" users, navarrow is SPECIAL
USERS=$(./pygithub-ex.sh)

for user in ${USERS};do
  linuxuser=${user,,} # lowercase
  echo "test -d /home/${linuxuser} || { useradd -m -s /bin/bash ${linuxuser}; usermod -aG docker ${linuxuser}; sudo su - ${linuxuser} sh -c 'ssh-import-id gh:${user}' ;}"
done
