#!/bin/bash

#copy ssh key to many hosts

echo "enter servers"
read -ra servers
echo "enter passwords"
read -ra passwords
echo "enter source key path"
read -ra source_key

for ((i=0;i<${#servers[@]};++i)); do
    sshpass -p "${passwords[i]}" ssh ${servers[i]} mkdir -p '$HOME/.ssh/'

    printf "%s is in %s\n" "${servers[i]}" "${passwords[i]}"
    sshpass -p "${passwords[i]}" ssh-copy-id -i $source_key ${servers[i]}
done 
