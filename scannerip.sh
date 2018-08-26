#!/bin/bash

### Questa funzione crea la barra di progresso

function ProgressBar
{
# Process data
let _progress=(${1}*100/${2}*100)/100
let _done=(${_progress}*4)/10
let _left=40-$_done
###Creco la lunghezza delle stringhe del progressbar
_fill=$(printf "%${_done}s")
_empty=$(printf "%${_left}s")

###creo progressbar strings e stampo ProgressBar line
###esempio
###Progress : [########################################] 100%
printf "\rProgress : [${_fill// /\#}${_empty// /-}] ${_progress}%%"
}

funzione_principale()
{
    ###bloccare i segnali di interruzione e richiamare la funzione cleanup che pulisce i log file
    trap 'cleanup' SIGHUP SIGINT SIGTRAP SIGILL
    echo "This script $0 scan your local network ip addresses to find devices connected."

    echo

    ###USO IL IFCONFIG PER CERCARE SE VUOLE UTILIZZARE I DATI DEL SUO PC
    ifconfig | grep "inet [^*]" | cut -d ' ' -f 10,13 | awk  '{print $2}'| sed '1d' > sub.txt
    ifconfig | grep "inet [^*]" | cut -d ' ' -f 10,13 | awk  '{print $1}'| sed '1d' > iploc.txt

    ###CREO LE VARIABILI della funzione principale
    SUBNET=$(cat sub.txt)
    IP=$(cat iploc.txt)
    counter=0

    ###STAMPO LE VARIABILI
    echo "Your Subnet is: $SUBNET"
    echo "Your Ip is: $IP"
    echo

    read -r -p "Do you want to use these parameters to scan the network? [Y/n]" Question

    case $Question in
        [yY][eE][sS]|[yY])
            echo -e "Okay...\n"
            read -r -p "You can choose from 1 to 255 ips to scan... Select a number:" N
            for ((i = 1; i <= N; i++)); do

                echo "$(ping $(cat iploc.txt | cut -d '.' -f 1,2,3).$i -c 1 )" >> ip.txt
                let counter++
                echo "trying... to ping $(cat iploc.txt | cut -d '.' -f 1,2,3).$i"
            done

            #inizio e fine del progress bar
            _start=1
            _end=$counter

            #progressBar
            echo
            for number in $(seq ${_start} ${_end})
            do
            sleep 0.1
            ProgressBar ${number} ${_end}
            done
            printf '\nFinished!\n'
            echo -e "\nOnly these ip addresses are online\n"
            cat ip.txt | grep "64[^*]" | cut -d ' ' -f 4 | cut -d ':' -f 1 | sort -u


            ;;
         [nN][oO]|[nN])
             echo -e "\nOkay bye\n"
             exit 1

             ;;

         *)
             echo "Invalid input..."
             exit 1
             ;;

         esac
}

cleanup(){

###Funzione per pulire i file di log
echo -e "\n\nRecieved exit code... Cleaning up\n"
###Variabili di inizio e fine progressbar
_start=1#
_end=100
for number in $(seq ${_start} ${_end})
do
    sleep 0.001
    ProgressBar ${number} ${_end}
done
printf '\nGoodBye!\n'

rm ip.txt sub.txt iploc.txt > /dev/null 2>&1

exit 1

}




funzione_principale















