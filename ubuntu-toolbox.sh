#!/bin/bash 


#alias inst='sudo apt install'
#alias rem='sudo apt remove'
#alias upd='sudo apt update'
#alias upg='sudo apt upgrade'
#alias snap='sudo snap'

skip()
{
        echo "This process will continue : $1"
        continue




}

echo "do you want to update upgrade or do both before you procced [1|2|3|4|5|]"

echo "1, update"
echo "2, upgrade"
echo "3, both"
echo "4, none and continue"
echo "5, exit"

read -rp "= " CHOICE 

if [ "$CHOICE" = 1 ]; then 
	sudo apt update -y 
	$skip_str
elif [ "$CHOICE" = 2 ]; then 
	sudo apt upgrade -y 
	$skip_str

elif [ "$CHOICE" = 3 ]; then
	sudo apt update && sudo apt upgrade -y  
	$skip_str 

elif [ "$CHOICE" = 4 ]; then
	$skip_str

else
	exit 

fi

echo "Would you like to continue to make changes to your system? [y|n]"
echo "y, Yes"
echo "n, No"

read -rp "= " CHOICE 

if [ "$CHOICE" = y ]; then 
	echo "Making changes to ubuntu....."
	sleep 5
	$skip_str
else
	echo "exiting....."
	exit 

fi



echo "removing the snap version of firefox"
snap remove firefox 
sleep 3 


echo "Would you like to remove the snap store and snaps or just the snap store [|1|2|3|4|]"
echo "1, snap-store"
echo "2, both"
echo "3, none"
echo "4, exit"

read -rp "= " CHOICE

if [ "$CHOICE" = 1 ]; then 
	echo "Removing the snap-store"
	sleep 3
	snap remove snap-store
	$skip_str

elif [ "$CHOICE" = 2 ]; then
	echo "removing both"
	sleep 3
	snap remove snap-store 
	rem snapd -y
	$skip_str

elif [ "$CHOICE" = 3 ]; then
       echo "Remove none...."
       sleep 3
       $skip_str       


else
	echo "Exiting...."
	sleep 3
	exit

fi 


# cat restricted.txt | xargs apt install -y   

cat build.txt | xargs apt install -y


# cat remove.txt | xargs apt remove -y  


add-apt-repository ppa:obsproject/obs-studio
apt update 

add-apt-repository ppa:kdenlive/kdenlive-stable 
apt update
sleep 3 

cat gnome.txt | xargs apt install -y 

cat remove.txt | xargs apt remove -y


echo "Choose the web browser you want to install?[1|2|3|4|5|6|7|8|9|10|]"
echo "1, FireFox"
echo "2, chromium"
echo "3, qutebrowser"
echo "4, ungoogled chromium"
echo "5, Brave"
echo "6, Brave-beta"
echo "7, Brave-dev"
echo "8, continue without any browser"
echo "9, exit"

read -rp "= " CHOICE

if [ "$CHOICE" = 1 ]; then
	sudo add-apt-repository ppa:mozillateam/ppa
	cp mozillateamppa /etc/apt/preferences.d/
	echo "Updating Repos...."
	sleep 3
	apt update -y
        apt install firefox -y 

elif [ "$CHOICE" = 2 ]; then
	  sudo add-apt-repository ppa:saiarcot895/chromium-beta
	  echo "Updating the Repos"
	  sleep 3
	  apt update -y
	  apt install chromium-browser -y 

elif [ "$CHOICE" = 3 ]; then
       	  echo "Installing qutebrowser"
  	  sleep 3
	  apt install qutebrowser -y 
	  
elif [ "$CHOICE" = 4 ]; then
	  echo "Installing ungoogled Chromium"
  	  aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-common-dbgsym_100.0.4896.127-1.unportable1_amd64.deb
	 aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-common_100.0.4896.127-1.unportable1_amd64.deb
	aria2c  https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-dbgsym_100.0.4896.127-1.unportable1_amd64.deb
	aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-driver-dbgsym_100.0.4896.127-1.unportable1_amd64.deb
	aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-driver_100.0.4896.127-1.unportable1_amd64.deb
	aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-l10n_100.0.4896.127-1.unportable1_all.deb
	aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-sandbox-dbgsym_100.0.4896.127-1.unportable1_amd64.deb
	aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium-sandbox_100.0.4896.127-1.unportable1_amd64.deb
	aria2c https://github.com/clickot/ungoogled-chromium-binaries/releases/download/100.0.4896.127-1/ungoogled-chromium_100.0.4896.127-1.unportable1_amd64.deb
	sudo dpkg -i *.deb
        echo "Finshed installing...."
	sleep 3 
	
elif [ "$CHOICE" = 5 ]; then
	   sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	   echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	   apt update -y 

	   apt install brave-browser -y 

elif [ "$CHOICE" = 6 ]; then
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg arch=amd64] https://brave-browser-apt-beta.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-beta.list
	apt update -y 
	apt install brave-browser-beta -y 

elif [ "$CHOICE" = 7 ]; then
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list
	apt update -y
	apt install brave-browser-nightly -y

elif [ "$CHOICE" = 8 ]; then
	$skip_str


else
	exit

fi


echo "You need to reboot to see the changes"
echo "Would you like to reboot now or later? [|1|2|]"
echo "1, Reboot"
echo "2, Later"

read -rp "= " CHOICE 

if [ $CHOICE = 1 ]; then
	echo "Rebooting now in 3 seconds"
	sleep 3
	reboot

else
	echo "Rebooting later...."
	exit

fi 






































