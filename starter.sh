#!/bin/bash


# Starter.sh by Mr. P3rry
# This script downloads my favorite scripts that I always use and makes some ssh and motd banners


#You have to be Root to run this script
if [ "$UID" -ne "0" ]
then
echo "Devi essere root per eseguire questo script."
exit $E_NONROOT
fi

#Here are the progress bars that i use in the script
#echo ">>>>>>>>>>>>>>>>>>>>>>>>>>"

progressCLI(){
  echo -en "\t\t: Installing Custom CLI"
  while true
  do
      sleep 0.25 &&  echo -ne "$(tput setaf 2)\r$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>$(tput sgr 0)"; sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>>>$(tput sgr 0)"
 done
}


progressTOR(){
    echo
    echo -en "\t\t: Installing Custom TOR setting"
  while true
  do
      sleep 0.25 &&  echo -ne "$(tput setaf 2)\r$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>$(tput sgr 0)"; sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>>>$(tput sgr 0)"
    sleep 5
 done
}

progressGIT(){
    echo
    echo -en "\t\t: Installing GitHub"
  while true
  do
      sleep 0.25 &&  echo -ne "$(tput setaf 2)\r$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>$(tput sgr 0)"; sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>>$(tput sgr 0)" && sleep 0.25 && echo -ne "$(tput setaf 2)\r>>>>>>>>>>>>>>>>$(tput sgr 0)"
    sleep 5
 done
}

banner(){

        echo -ne "\nDo you want to set shell and ssh banners: (y\N)"
        read ban

        case $ban in
            [yY][eE][sS]|[yY])

                read -r -p "What type of banner do you want to use $(tput setaf 3)ASCII$(tput sgr 0) o $(tput setaf 4)Graphical ASCII$(tput sgr 0)[1/2]" Question
                case $Question in

                1)
                    echo "$(tput setaf 2)[+]$(tput sgr 0) You sceleted only ASCII"
                    apt-get install figlet -y &>/dev/null
                    echo -en "What do you want to write in your banner: "
                    read text1
                    echo -en "your banner will look like this\n"
                    echo -en "$(tput setaf 3)$(figlet $text1)$(tput setaf 0)"
                    ;;

                2)
                    echo "$(tput setaf 2)[+]$(tput sgr 0) You selected grafical ASCII"
                    apt-get install cowsay -y &>/dev/null
                    echo -en "What do you want to write in your banner: "
                    read text2
                    echo -en "your banner will look like this\n"
                    echo -en "$(tput setaf 4)$(cowsay -f eyes $text2)$(tput setaf 0)"
                    echo -en "\n"
                    echo 'echo -ne "\n$(tput setaf 4)$(cowsay -f eyes $USER_custom_test)$(tput setaf 0)\n"' > code.txt
                    cat code.txt | sed -e 's/$USER_custom_test/'$text2'/g' >> /root/.bashrc




                    ;;
                *)
                    echo "invalid input"
                    ;;
            esac


                    ;;
    [nN][oO]|[nN])
        echo "okay bye"
        exit 1
        ;;
    *)
        echo "Invalid Input..."
        exit 1
        ;;
esac

}



#This is the main funtion where I install CLI and nipe tools

main(){



            echo -e "$(tput setaf 2)[+]$(tput sgr 0)Making\t: Path for downloading files"
            mkdir -p /root/home/git/style
            echo -e "$(tput setaf 2)[+]$(tput sgr 0)Cloning\t: From git repo"


            ##Here I try to isolate the process of cloning the style1 git repo in order to make the processbar
            progressCLI &
            MYSELF=$!
            git clone https://github.com/danieleperera/style1 /root/home/git/style &>/dev/null
            PATH=$PATH:/root/home/git/style
            install.sh &>/dev/null
            kill $MYSELF
            wait $MYSELF >/dev/null 2>&1


            ##Here I try to isolate the process of cloning and installing nipe for default tor gateway
            progressTOR &
            MYSELF=$!
            git clone https://github.com/GouveaHeitor/nipe /root/home/git/tor &>/dev/null
            PATH=$PATH:/root/home/git/tor
            cpan install Switch JSON LWP::UserAgent &>/dev/null
            perl nipe.pl install &>/dev/null
            perl nipe.pl start &>/dev/null
            ping 192.168.1.128 -c 20 &>/dev/null
            kill $MYSELF
            wait $MYSELF >/dev/null 2>&1
            echo

}




##This is what you first see


echo -ne "This script configure your linux distro.\n"
echo -ne "Do you want to continue: (y/N)"
read input

case $input in
    [yY][eE][sS]|[yY])

        if ! [ -x "$(command -v git)" ]; then
            echo -e "\n$(tput setaf 1)[+]$(tput sgr 0)Error\t: GitHub is not installed." >&2

            ##Here i isolate installing git process

            progressGIT &
            MYSELF=$!
            apt-get install git -y &>/dev/null
            kill $MYSELF
            wait $MYSELF >/dev/null 2>&1
            echo

            ##I recall the main funtion when github isn't installed

            main
            banner
        else
            echo -e "$(tput setaf 2)[+]$(tput sgr 0)Done\t\t: GitHub is already installed"

            ##I recall the main funtion where github is already installed
            #main
            banner
            fi
        ;;
    [nN][oO]|[nN])
        echo "okay bye"
        exit 1
        ;;
    *)
        echo "Invalid Input..."
        exit 1
        ;;
esac
