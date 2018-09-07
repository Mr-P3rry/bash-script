#!/bin/bash


for color in {22..231} ; do # Colors
    # Display the color
printf "\e[48;5;%sm  %3s  \e[0m" $color $color
    # Display 6 colors per lines
if [ $((($color + 1) % 6)) == 4 ] ; then
    echo # New line
fi
done
echo # New line

echo -ne "select a color:"
read num
printf "\e[38;5;%sm  %3s  " $num $num
echo # New Line

exit 0




