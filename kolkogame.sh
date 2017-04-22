#!/bin/bash

# 1 - x, 0 - o

player=1

tab=[];

for x in {1..10}
do
   tab[$x]=" "
done

y=0
while [ $y -lt 9 ]
do
  if [ "$player" -eq 0 ]; then
  echo "player o"
else
   echo "player x"
fi

  echo "podaj liczbe"
  read liczba
  clear
  if [ "$liczba" -gt 0 ] && [ "$liczba" -le 9 ]; then   
    if [ "${tab[$liczba]}" == " " ]
    then
       y=$[$y+1]
       if [ "$player" -eq 0 ]; then
         tab[$liczba]="O"
         player=1
       else
         tab[$liczba]="X"
         player=0
       fi
     else
       echo "Te pole juz jest wypelnione" 
     fi
   fi 

# wyswietlanie
  for i in {1..9}
  do
    if  ((i % 3)); then
      echo -n "${tab[i]} | "
    else
      echo "${tab[i]}"
    fi
   done

done











