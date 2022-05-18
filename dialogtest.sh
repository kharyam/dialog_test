#!/bin/bash
set -e

common_options='--backtitle MyTUI'
#dialog_command=Xdialog
dialog_command="dialog $common_options"

$dialog_command --erase-on-exit --yesno "Proceed?" 6 30

exec 3>&1;
selection=$($dialog_command --checklist "Select Stuff" 30 80 24 \
   1 "This is choice 1" off \
   2 "This is choice 2" off \
   3 "This is choice 3" off \
   4 "This is choice 4" off \
   5 "This is choice 5" off \
   6 "This is choice 6" off 2>&1 1>&3)

exitcode=$?

COUNT=1
(
while [[ $COUNT -le 100 ]]
do
  echo $COUNT
  echo "XXX"
  echo "Selection: $selection - Progress: $COUNT percent"
  echo "XXX"
  COUNT=`expr $COUNT + 1`
  sleep .05
done
) |
$dialog_command --erase-on-exit --gauge "Hi, this is a gauge widget" 6 70 0
