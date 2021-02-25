#!/bin/bash
clear

day=$(date)
user=$(whoami)

function opDep {
echo "-----------OpDep----------------"
echo" User: $user"
cat OpDep.txt
echo ""
echo "--------------------------------"
echo "| Look and you'll see  "
echo "| Press [x] to modify Report"
read opans

if [ $opans == "x" ]; then

nano OpDep.txt
OpDep

fi

}


function backup {

  clear
  bkupt=1
  bkupf=2
  inpf=3
  x=0
  user=$(whoami)
  day=$(date)
  input=''
  output=/tmp/${user}_home_$(date +Y-%m-%d_%H%M%S).tar.gz

  echo "--------------Welcome--------------"
  echo "Author: GurbBerd"
  echo "Version: 0.75"
  echo "Last Update: Feb 25th 2021"
  echo ""
  echo "------------User Info--------------"
  echo "Current user: $user"
  echo "Today is $day"
  echo "Your Bash verion is $BASH_VERSION"
  echo "-----------------------------------"
  echo "PRESS ENTER TO BACKUP $input"
  echo "OR PRESS CTRL+C TO CANCEL"
  read
  clear

  function total_files {
    find $1 -type f | wc -l
    }

  function total_directories {
  find $1 -type d | wc -l
    }

  function total_archived_directories {
    tar -tzf $1 | grep /$ | wc -l
    }

  function total_archived_files {
    tar -tzf $1 | grep -v /$ | wc -l
    }

  echo "--------Details of Backup---------"
  echo -n "Total Files in $input: "
  total_files $input
  echo -n "Total directories in $input: "
  total_directories $input
  echo "----------------------------------"
  echo "Are you sure you want to backup $input (y/n) "?
  read -p "Answer must be lowercase (y) anything else will stop script: " resp

  if [ $resp ==  "y" ]; then
    clear
    echo "Starting Backup"
    echo "--------------------------------"
    tar -czf $output $input 2> /dev/null

    x=$bkupt
    src_files=$( total_files $input )
    src_directories=$( total_directories $input )
    arch_files=$( total_archived_files $output )
    arch_directories=$( total_archived_directories $output )

  else
    clear
    x=$inpf
  fi

   if [ $src_files -eq $arch_files ] && [ $x -eq $bkupt ]; then
    clear
    echo "Backup of $input complete"
    echo "-----------Details------------"
    echo "Files expected: $src_files "
    echo "Directories expected: $src_directories "
    echo "Archived files: $arch_files"
    echo "Archived directories: $arch_directories"
    echo "------------------------------"
    echo "Press any key to exit"
    read
    clear
    else
        if [ $x -eq $inpf ]; then

              echo "---------Input Error--------------"
              echo "User aborted backup"
              echo "----------------------------------"
              echo "Press any key to exit"
              read
              clear
        fi

   fi
home_base

}

function journals {
  clear
  cd /DeHub/Jounals
  echo "---------------------------------"
  echo "|Journals"
  echo ""
  echo "What Journal would you like to open?"
  echo ""
  echo "Press [x] to create a new journal"
  echo "Press [1] for blahblahblah"
  echo "Press [2] for blahblahblah"
  echo "Press [3] for blahblahblah"
  echo "Press [4] for blahblahblah"
  echo ""
  echo "Press [h] to go back to Home"
  echo "---------------------------------"
  echo "Anser must be an option above or program will idle. "
  echo ""
  read -p "[*]" jansr

  if [ $jansr == "x" ]; then

    clear
    echo "Please enter name of journal you want to create"
    echo ""
    echo "Ensure you have entered (.txt) to the end of file "
    read -p "[*]" njansr
    clear
    echo "Are you sure you want to create a file names $njansr ?"
    echo ""
    read -p "Answer must be lowercase [y] or [n]" yn

    if [ $yn == "y" ]; then

      clear
      cat > $njansr

    fi

    if [ $yn == "n" ]; then

      clear
      journals

    fi

fi
  if [ $jansr == "1" ]; then

    nano blahblahblah.txt
    journals
  fi

  if [ $jansr == "2" ]; then

    nano blahblahblah.txt
    journals

fi

  if [ $jansr == "3" ]; then

    nano blahblahblah.txt
    journals
  fi

  if [ $jansr == "4" ]; then

    nano blahblahblah.txt
    journals

  fi

  if [ $jansr == "h" ]; then

    clear
    home_base

  fi
}


function home_base {

cd /DeHub/
clear

echo "     DeHub v0.75"
echo "---------------------------------"
echo "| Author: GurbBerd"
echo "| Welcome: $user "
echo "| Date and Time: $day "
echo "---------------------------------"
echo "| Remember to exit terminal to kill script"
echo "| Remember that if you leave a txt file open, it will stay open until end of script"
echo "---------------------------------"
echo "|Remarks from last session"
echo ""
cat rmks.txt
echo ""
echo "---------------------------------"
echo "What would you like to do?"
echo ""
echo "Press [x] to leave a remark"
echo "Press [o] to For Operations "
echo "Press [1] to view Journals"
echo "Press [2] to open Atom Text Editor "
echo "Press [3] to move path to Your Projects and exit DeHub"
echo "Press [4] to enter backup script"
echo "Press [5] to Open Spotify (Will Halt Dehub, Perhaps python can fix that)"
echo "---------------------------------"
echo "Answer must be an option above or the program will idle. "
echo "Press CRTL+C to exit"
echo ""
read -p "[*] " ansr

if [ $ansr == "x" ]; then

clear
nano rmks.txt

home_base

fi

if [ $ansr == "o"]; then

  clear
  opDep

fi

if [ $ansr == "1" ]; then

  clear
  journals

fi

if [ $ansr == "2" ]; then

atom
home_base

else
  clear

fi

if [ $ansr == "3" ]; then

clear
cd /DeHub/Projects
exec bash
fi

if [ $ansr == "4" ]; then

backup

fi

if [$ansr == "5"]; then

  clear
  spotify

else

  home_base

fi

}
home_base
