#!/bin/bash

#ls -d */ > directorio.txt
now="$(date +'%d/%m/%Y')"
time="$(date +'%r')"
who="$(whoami)"
inod="$(ls -id)"
dir="$(pwd)"
table="<table>
  <tr>
    <th>Fecha informe: $now<br>Hora informe: $time <br>Usuario sesión: $who</th>
    <th>Directorio: $dir</th>
    <th>#Inodos<br>$inod</th>
  </tr>
  <tr>
    <td>Numero de inodo</td>
    <td>Permisos</td>
    <td>Usuario</td>
    <td>Grupo</td>
  </tr>"
echo $table
filedir='directorio.txt'
fileinodes='inodos.txt'
n=1
n2=1
table2=""
while read line; do
while read line2; do
data="$(ls -i -l -r $line)"
if [ -d "$line2" ]; then
table2="<tr>$line2"
else
echo "$line2" > loginodos.txt
fi
if [ -d "$line" ]; then
table2="$table2
    $data
  </tr>"
else
echo "$line" > logdir.txt
fi
n2=$((n2+1))
done < $fileinodes
n=$((n+1))
done < $filedir
table3 = "</tr>
</table>"
table ="$table $table2 $table3"
echo $table > informe.html
