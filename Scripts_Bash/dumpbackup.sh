#!/bin/bash

while :
do
echo "Selecciona una opcion [1-2]"
echo "1) Respaldar datos del pendrive"
echo "2) Recuperar datos"

read opcion

   case $opcion in
        1)
        echo "Ejecutando backup..";
        sudo dump 0zf /media/luis/283A9CAC3A1815B4/backup.dump /media/luis/DataTravel;
        exit 1;;

        2)
        echo "Ejecutando recuperacion de datos..";
        cd /media/luis/283A9CAC3A1815B4/MME_L_Luis_Acosta;
        sudo restore -r -f ../backup.dump;
        exit 1;;
   esac
done
