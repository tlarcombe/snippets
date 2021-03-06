## Pasted here because I will probably lose the source.  

#!/bin/bash

# Start scan is a script which will setup your first steps of the pen test
# It will create a directory with the given name 
# It will execute nmap and gobuster and store the output in the init file in their directories

# Author: Menno Fesevur, 2020
# TryHackMe Name: zeMenno

ip_address=''
directory_name=''
force=false
wordlist='/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt'

print_usage(){
	echo 'usage: startscan -i <ip address> -d <directory_name> -w <wordlist> [-f]'
	echo ' -i 	The Ip Address of the target machine'
	echo ' -d 	The directory where all the output will be'
	echo ' -f 	Force the scans even when the host can not be pinged'
	echo ' -w 	Add a custom wordlist for GoBuster'
}

exec_code(){
	echo "[StartScan] Making directories/files"

	mkdir $directory_name
	mkdir $directory_name/nmap
	touch $directory_name/nmap/init
	mkdir $directory_name/gobuster
	touch $directory_name/gobuster/init


	touch $directory_name/README.md
	echo '```export IP='$ip_address'```' > $directory_name/README.md
	echo "[StartScan] Created a README.md in the directory: $directory_name"	

	echo '[StartScan] Running NMAP'

	sudo nmap -sS -sV -T4 -A $ip_address -oN $directory_name/nmap/init

	echo '[StartScan] Running GoBuster'

	echo '[StartScan] GoBuster will take a while, start by looking at the nmap output'

	sudo gobuster dir -u http://$ip_address -w $wordlist > $directory_name/gobuster/init
}

while getopts 'hi:d:fw:' flag; do
	case "${flag}" in
		f) force=true ;;
		i) ip_address="${OPTARG}" ;;
		d) directory_name="${OPTARG}" ;;
		w) wordlist="${OPTARG}" ;;
		h) print_usage
		   exit 1 ;;
	esac
done
if [[ $ip_address == '' || $directory_name == '' ]]; then
	echo 'ERROR: Not all parameters are filled'
	echo 'Try: "startscan -h" for more info'
	exit
fi


if [[ $force ]]; 
then
	echo "[StartScan] Forcing the scans"
	exec_code
else
	echo "[StartScan] Checking if host is up"
	if ping -c 1 $ip_address &> /dev/null 
	then
		exec_code
	else
		echo 'ERROR: Host is not up, do you have the right ip address?'
	fi 
fi
