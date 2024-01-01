#!/bin/bash

printf "Initiating script for creating an apache HTTP server\n"

printf "Updating the system...\n"

apt-get update
apt-get upgrade -y

printf "Installing apache2...\n"

apt-get install apache2 -y

printf "Script finished. Please verify the apache web server running at this machine (the machine that is running the script) ip address or its localhost.\n"
