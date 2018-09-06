#!/bin/bash

#TCP_connection.sh  - Cerco di automatizzare il processo dal avere lo scan di nmap fino
#alle prove empiriche con ncat


echo -n "Enter ip address of the host to scan ports:"
read ip

progress(){
  echo -e "Stiamo provando 65535 porte\n"
  echo -n "Please wait ..."
  while true
  do
    echo -n "."
    sleep 5
 done
}

progress &
MYSELF=$!
ports="$(nmap -sV -O $ip -p1-65535 > scan.txt)"
kill $MYSELF
wait $MYSELF>/dev/null 2>&1
echo -n "...done."
echo

echo "$(cat scan.txt | grep -o '[^"]*tcp[^"]*')"
for url in $(cat scan.txt | grep -o '[^"]*tcp' | cut -d "/" -f1)
    do
    nc -nv $ip $url
    sleep 1
done
rm scan.txt
