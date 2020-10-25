#!/bin/bash
#OSINFO Installer v1.0
#Powered by Crazy Indian Developer
#Created by Crazy Indian Developer
#Credits goes to CrazyIndianDeveloper [github.com/CrazyIndianDeveloper]



if [ "$(id -u)" != "0" ]; then
    echo "Please run installer as a Superuser" >&2
    printf " \e[1;31m \tTry this ---> sudo ./installer.sh  \e[0m \n"
    exit 1
fi
clear
red="\e[0;31m"
green="\e[0;32m"
off="\e[0m"


clear
printf "\e[0;31m                  ██████╗ ███████╗\e[0m\n"
printf "\e[0;31m                 ██╔═══██╗██╔════╝\e[0m\n"
printf "\e[0;31m                 ██║   ██║███████╗\e[0m\n"
printf "\e[0;31m                 ██║   ██║╚════██║\e[0m\n"
printf "\e[0;31m                 ╚██████╔╝███████║\e[0m\n"
printf "\e[0;31m                  ╚═════╝ ╚══════╝\e[0m\n"

printf "\e[0;37m              ██╗███╗   ██╗███████╗ ██████╗ \e[0m\n"
printf "\e[0;37m              ██║████╗  ██║██╔════╝██╔═══██╗\e[0m\n"
printf "\e[0;37m              ██║██╔██╗ ██║█████╗  ██║   ██║\e[0m\n"
printf "\e[0;37m              ██║██║╚██╗██║██╔══╝  ██║   ██║\e[0m\n"
printf "\e[0;37m              ██║██║ ╚████║██║     ╚██████╔╝\e[0m\n"
printf "\e[0;37m              ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ \e[0m\n"

printf " \e[1;31m \t\tBy- Crazy Indian Developer \e[0m \n"

if [ -e "/usr/share/osinfo" ]; then
  echo -e "$red [$green+$red]$off A previous installation was found!! Do you want to replace it? [Y/n]: "
read replace
if [ "$replace" == "y" ] || [ "$replace" == "Y" ] || [ -z "$replace" ]; then
 rm -r "/usr/share/osinfo"
else
  echo -e "$red [$green✘$red]$off If You Want To Install You Must Remove Previous Installations";
  echo -e "$red [$green✘$red]$off Installation Failed";
 exit
fi
fi
echo -e "$red [$green+$red]$off Installing ...";
sudo mv osinfo.crazyindiandeveloper osinfo.sh
sudo chmod +x osinfo.sh
sudo mkdir "/usr/share/osinfo"  
sudo cp "osinfo.sh" "/usr/share/osinfo"

  echo -e "$red [$green+$red]$off Creating Symbolic Link ...";
echo -e "#!/bin/bash
sh /usr/share/osinfo/osinfo.sh" '${1+"$@"}' > "osinfo";
sudo chmod +x "osinfo";


sudo cp "config/osinfo.png" "/usr/share/icons"
   sudo cp "config/osinfo.desktop" "/usr/share/applications"
sudo cp "osinfo" "/usr/local/bin/"
sudo rm osinfo
sudo mv osinfo.sh osinfo.crazyindiandeveloper
 


if [ -d "/usr/share/osinfo" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Installed And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing $green osinfo$off"
sleep 5;
osinfo
fi
exit

