#!/bin/bash
clear
N='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'
B='\033[0;34m'
Y='\033[0;38m'       	# Yellow
C='\033[0;36m'         	# Cyan
W='\033[0;37m'        	# White

echo -e "
          ${Y}    UFinder
     ${C}-> A Tool To Find Username 
     ${C}-> Across Internet 
     ${Y}-> OSINT Automaton Tool
    ${C} -> Scripted By : ${G}Rajya Vardhan
	${W} -> Twitter   : ${B}https://www.twitter.com/vardhanrajya08
	${W} -> Instagram : ${B}https://www.twitter.com/vardhanrajya08    
    ${B} -> Use only for Education purpose
   
      
      
      ${Y} Usage: bash $0 list.txt Username 
      ${O} Nothing Is Perfect, Try Again And Make It 
          "
          

LISTS=$1
UNAME=$2

if [[ ! -f ${1} ]]; then
	echo -e ${R}"ERROR: ${1} List Or Username Not Found"
	echo -e ${C}"Usage: $0 list.txt Username"
	exit
fi

for SITE in $(cat $LISTS);
do
	link=$(echo $SITE | sed "s/usrname/$2/")
	response=$(curl -I $link 2>/dev/null | head -n 1 | cut -d$' ' -f2)
    if [[ $response =~ '200' ]]; then
		echo -e "\e[32m[+] FOUND: ${link}"
	else
		echo -e "\e[31m[-] NOT FOUND: ${link}"
	fi
done
  