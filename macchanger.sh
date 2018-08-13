#! /bin/bash

echo Script per cambiare mac-address !

ROOT_UID=0 
# Da eseguire come root, naturalmente.
if [ "$UID" -ne "$ROOT_UID" ]
then
echo "Devi essere root per eseguire questo script."
exit $E_NONROOT
fi



ifconfig > ifconfig.txt


#stampa il mac address attuale
cat ifconfig.txt | tail | grep ether 
echo 


ifconfig wlo1 down
macchanger -r wlo1
ifconfig wlo1 up
dhclient -4 wlo1

echo
#stampa mac address modificato
ifconfig | grep ether
echo


#flushare il cache di dns

systemd-resolve --statistics
echo

systemd-resolve --flush-cache
echo ==========================
systemd-resolve --statistics

exit
