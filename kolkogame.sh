#!/bin/bash

# 1 - x, 0 - o

player=1
tab=[]
isWin=0

for x in {1..10}
do
   tab[$x]=" "
done


function sprawdz
{
  mark=$1

  #sprawdz czy row sa takie same
  for i in 1 4 7; do
    if [ "${tab[$i]}" == "$mark" ] && [ "${tab[$i+1]}" == "$mark" ] && [ "${tab[$i+2]}" == "$mark" ]; then
      isWin=1
      return $isWin
    fi
  done

  #sprawdz czy kolumny sa takie same 
  for i in 1 2 3; do
    if [ "${tab[$i]}" == "$mark" ] && [ "${tab[$i+3]}" == "$mark" ] && [ "${tab[$i+6]}" == "$mark" ]; then
      isWin=1
      return $isWin
    fi
  done

  # sprawdz na krzyz
  if [ "${tab[1]}" == "$mark" ] && [ "${tab[5]}" == "$mark" ] && [ "${tab[9]}" == "$mark" ]; then
    isWin=1
    return $isWin
  fi

  if [ "${tab[3]}" == "$mark" ] && [ "${tab[5]}" == "$mark" ] && [ "${tab[7]}" == "$mark" ]; then
    isWin=1
    return $isWin
  fi

  return $isWin
}

function wypisz
{
  for i in {1..9}
  do
    if  ((i % 3)); then
      echo -n "${tab[i]} | "
    else
      echo "${tab[i]}"
    fi
   done 
}


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
       mark_char=""
       if [ "$player" -eq 0 ]; then
        mark_char="O"
         tab[$liczba]="O"
         player=1
       else
        mark_char="X"
         tab[$liczba]="X"
         player=0
       fi
       sprawdz $mark_char
       if [ "$isWin" -eq 1 ]; then
        echo "Gracz $mark_char wygral!"
        break
       fi
     else
       echo "Te pole juz jest wypelnione" 
     fi
   fi 

# wyswietlanie

wypisz

done










