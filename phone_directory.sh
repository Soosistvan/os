#!/bin/bash
export LANG=C.UTF-8

while :
do
clear
echo "Köszöntelek a telefonkönyvben!"
echo "1. Személyek hozzáaadása"
echo "2. Személyek keresése"
echo "3. Személyk törlése"
echo "4. Személyek megtekintése"
echo "5. Quit"
read -p "Válassz menüpontot (1-5)" usr_cmd
clear

case $usr_cmd in
1)echo "Új személy hozzáadása"
 read -p "Add meg a nevét: " name
echo "Elfogadva"
read -p "Add meg a telefonszámát: " number
clear
echo "Uj személy adatai: "
echo "-> Név: $name. -> Telefonsz�: $number"
echo "$name : $number" >> phonedir.log
echo "Sikeres mentés";;
2) echo "Személy keresése"
  read -p "Gépeld be a keresedő személy nevét: " search_query
  clear
  echo "Keresési eredmények: "
  grep -i $search_query phonedir.log
 ;;
3)echo "Személy törlése" 
  read -p "Gépeld be a törlendő személy nevét: " delete_string
  sed -i -e "/$delete_string/d" phonedir.log
  echo "Törlés sikeres!";;
4)echo "Telefonkönyv"
  echo ""
  cat phonedir.log;;
5)break;;
*)echo "Helytelen opció";;
esac;


read -p "Nyomd meg az 5-öst a, vagy akármi mást hogy visszatérj a Fomenübe" confirm_exit
if [ $confirm_exit -eq 5 ]
then break
fi
done

