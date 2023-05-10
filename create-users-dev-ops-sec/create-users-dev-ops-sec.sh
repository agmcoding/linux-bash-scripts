#!/bin/bash

printf "Initiating script for creating directories, groups, users and permissions for devs, ops, and secs\n"

printf "Creating directories at /usr/group-directories ...\n"

mkdir --verbose /usr/group-directories
mkdir --verbose /usr/group-directories/public
mkdir --verbose /usr/group-directories/dev
mkdir --verbose /usr/group-directories/ops
mkdir --verbose /usr/group-directories/sec

printf "Creating groups...\n"

groupadd DEV_GROUP
groupadd OPS_GROUP
groupadd SEC_GROUP

printf "Creating users...\n"

useradd developer1 -m -G DEV_GROUP -p $(openssl passwd -crypt putPasswordHere)
useradd developer2 -m -G DEV_GROUP -p $(openssl passwd -crypt putPasswordHere)
useradd developer3 -m -G DEV_GROUP -p $(openssl passwd -crypt putPasswordHere)

useradd operator1 -m -G OPS_GROUP -p $(openssl passwd -crypt putPasswordHere)
useradd operator2 -m -G OPS_GROUP -p $(openssl passwd -crypt putPasswordHere)
useradd operator3 -m -G OPS_GROUP -p $(openssl passwd -crypt putPasswordHere)

useradd security1 -m -G SEC_GROUP -p $(openssl passwd -crypt putPasswordHere)
useradd security2 -m -G SEC_GROUP -p $(openssl passwd -crypt putPasswordHere)
useradd security3 -m -G SEC_GROUP -p $(openssl passwd -crypt putPasswordHere)

printf "Attributing the groups to the directories...\n"

chown root:DEV_GROUP /usr/group-directories/dev
chown root:OPS_GROUP /usr/group-directories/ops
chown root:SEC_GROUP /usr/group-directories/sec

printf "Creating permissions...\n"

chmod 777 /usr/group-directories/public
chmod 770 /usr/group-directories/dev
chmod 770 /usr/group-directories/ops
chmod 770 /usr/group-directories/sec

printf "Script finished.\n"
