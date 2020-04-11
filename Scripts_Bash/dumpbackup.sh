#!/bin/bash

while :
do
echo "Selecciona una opcion [1-2]"
echo "1) Respaldar datos del pendrive (copia completa)"
echo "2) Respaldar datos del pendrive (copia incremental)"
echo "3) Recuperar datos"

read opcion

   case $opcion in
        1)
        echo "Ejecutando backup completa..";
        sudo dump 0zf /media/luis/283A9CAC3A1815B4/backup.dump /media/luis/DataTravel;
        exit 1;;

        2)
        echo "Ejecutando backup incremental..";
        sudo dump 1zf /media/luis/283A9CAC3A1815B4/backup.dump /media/luis/DataTravel;
        exit 1;;

        3)
        echo "Ejecutando recuperacion de datos..";
        cd /media/luis/283A9CAC3A1815B4/MME_L_Luis_Acosta;
        sudo restore -r -f ../backup.dump;
        exit 1;;
   esac
done
