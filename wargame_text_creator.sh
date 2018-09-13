#!/bin/bash

## wargame_test


echo -ne "How many levels are there in the war game: "
read num

echo -ne "What is the name of the wargame:"
read nam

process(){
echo -ne "Level \t\t Password \t\t Commands \n\n"
for ((i = 1; i <= num; i++));do
echo -e "Level $i \t\t"
done
}


process >> $nam.txt
