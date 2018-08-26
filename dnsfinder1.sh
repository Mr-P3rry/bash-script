#!/bin/bash

#Chiedi URL del sito web
read -p "Enter url: " WEBSITE

#output viene dato come .html anche se la pagina è in php

wget -q --show-progress --progress=bar:force $WEBSITE --output-document=index.html 

echo
echo "These are the dns domains found in the url: "
echo


#cerco al interno della pagina web i domini presenti

cat index.html | grep -o 'http://[^"]*'| cut -d '/' -f 3 | sort -u > list.txt

cat list.txt

#cerco indirizzio ip dei domini

echo
for url in $(cat list.txt); do host $url;done > ip.txt

cat ip.txt 
#elimino il file html

rm index.html 
