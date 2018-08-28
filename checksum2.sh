#!/bin/bash


trap 'cleanup' SIGHUP SIGINT SIGTRAP SIGILL
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches



cleanup(){

        ###Funzione per pulire i file di log
        echo -e "\n\nRecieved exit code... Cleaning up\n"
        ###Variabili di inizio e fine progressbar
        #_start=1#
        #_end=100
        #for number in $(seq ${_start} ${_end})
        #do
        #sleep 0.001
        #ProgressBar ${number} ${_end}
        #done
        printf '\nGoodBye!\n'

        rm check.txt esiste.txt lista2.txt > /dev/null 2>&1

        exit 1
    }
primo(){
read -r -p "Cerca un file: " MAH


updatedb 2> /dev/null
locate $MAH | nl > lista2.txt

cat lista2.txt

echo
read -r -p "Seleziona il numero:" lista2

risultato=$( shasum $(cat lista2.txt | sed "${lista2}q;d" | awk '{print$2}') | awk '{print$1}' )

echo "$risultato"

read -r -p "Insert the other check value:" VERFY
if [ "$risultato" == "$VERFY" ]
then
    echo -e "IT's Verified"
else
    echo -e "IT's not Verified"
fi
}


secondo(){

    read -r -p "Cerca un file: " MAH


    updatedb 2> /dev/null
    locate $MAH | nl > lista2.txt

    cat lista2.txt

    echo
    read -r -p "Seleziona il numero:" lista2

	risultato=$( shasum -a 512 $(cat lista2.txt | sed "${lista2}q;d" | awk '{print$2}') | awk '{print$1}' )

	echo "$risultato"

	read -r -p "Insert the other check value:" VERFY
	if [ "$risultato" == "$VERFY" ]
    then
        echo -e "IT's Verified"
    else
        echo -e "IT's not Verified"
    fi
}

terzo(){
read -r -p "Cerca un file: " MAH


updatedb 2> /dev/null
locate $MAH | nl > lista2.txt

cat lista2.txt

echo
read -r -p "Seleziona il numero:" lista2

risultato=$( shasum -a 512 $(cat lista2.txt | sed "${lista2}q;d" | awk '{print$2}') | awk '{print$1}' )

echo "$risultato"

read -r -p "Insert the other check value:" VERFY
if [ "$risultato" == "$VERFY" ]
then
    echo -e "IT's Verified"
else
    echo -e "IT's not Verified"
fi
}

quarto(){
read -r -p "Cerca un file: " MAH


updatedb 2> /dev/null
locate $MAH | nl > lista2.txt

cat lista2.txt

echo
read -r -p "Seleziona il numero:" lista2

risultato=$( shasum -a 512 $(cat lista2.txt | sed "${lista2}q;d" | awk '{print$2}') | awk '{print$1}' )

echo "$risultato"

read -r -p "Insert the other check value:" VERFY
if [ "$risultato" == "$VERFY" ]
then
    echo -e "IT's Verified"
else
    echo -e "IT's not Verified"
fi
}


quinto(){
read -r -p "Cerca un file: " MAH


updatedb 2> /dev/null
locate $MAH | nl > lista2.txt

cat lista2.txt

echo
read -r -p "Seleziona il numero:" lista2

risultato=$( shasum -a 512 $(cat lista2.txt | sed "${lista2}q;d" | awk '{print$2}') | awk '{print$1}' )

echo "$risultato"

read -r -p "Insert the other check value:" VERFY
if [ "$risultato" == "$VERFY" ]
then
    echo -e "IT's Verified"
else
    echo -e "IT's not Verified"
fi
}

principale(){
echo -e "\nThis script $0 create hash and check it for you\n"

read -r -p "What hash do you want to use: sha1,sha2,sha256,sha512 :" HAS

case $HAS in
    sha1|1)
        echo -e "\nsha1 selected...\n"
        primo
        ;;
    sha224|224)
        echo -e "\nsha224 selected...\n"
        secondo
        ;;
    sha256|256)
        echo -e "\nsha256 selected...\n"
        terzo
        ;;
    sha384|384)
        echo -e "\nsha384 selected...\n"
        quarto
        ;;
    sha512|512)
        echo -e "\nsha512 selected...\n"
        quinto
        ;;
        *)
        echo "Invalid Input..."
        exit 1
        ;;
    esac
}

localizza(){

   prova=$( dpkg -l | grep -o "locate" )

    if [ "$prova" == "locate" ]
    then
        echo "Hai i programmi necessario per proseguire..."
        principale
    else
        echo -e "\n Questo script ha bisogno del programma locate..\n"
        read -r -p "Vuoi installare locate adesso : (Y\n)" DOMANDA
        case $DOMANDA in
            [yY][eE][sS]|[yY])
                sudo apt-get install locate -y
                principale
                ;;
            [nN][oO]|[nN])
                echo "good bye"
		cleanup
                ;;
            *)
                echo "Invalid input"
                cleanup
                ;;
        esac
    fi
}



localizza

