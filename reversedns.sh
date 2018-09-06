#/bin/bash

# reversedns.sh prendendo un sito provo a pingare e vedere se ci sono altri dns possibili


echo -n "Inserisci il dns server name:"
read server

#trovo ip del dns name
host -4 $server| head -n 1 | grep -o 'address [^"]*'| cut -d " " -f2 > ip.txt
#trovato ip

progress(){
  echo -e "Stiamo provando 65535 porte\n"
  echo -n "Please wait ..."
  while true
  do
    echo -n "."
    sleep 5
 done
}


dotest(){
for TEST in {1..254};do
     host $(cat ip.txt | cut -d '.' -f 1,2,3).$TEST >>list.txt

done
}

progress &
MYSELF=$!

dotest

kill $MYSELF
wait $MYSELF 2>/dev/null
echo -n "...done."
echo -e "\n\n"
cat list.txt | grep 'domain [^"]*' | cut -d " " -f5 | sort -u

rm list.txt


