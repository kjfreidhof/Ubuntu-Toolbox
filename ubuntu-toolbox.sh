#!/bin/sh 
fire='sudo apt remove firefox -y'
#inst='sudo apt install -y'
build='cat build.txt | sudo xargs apt install -y'
obs='sudo add-apt-repository ppa:obsproject/obs-studio && sudo apt update -y && sudo apt install obs-studio -y'
kdenlive='sudo add-apt-repository ppa:kdenlive/kdenlive-stable &&
sudo apt update -y && sudo apt install kdenlive -y'
gnome='cat gnome.txt | sudo xargs apt install -y'
rem='sudo apt remove -y'
#upd='sudo apt update -y'
#upg='sudo apt upgrade -y'
upgy='sudo apt update && sudo apt upgrade -y'
#snap='sudo snap'


for i in 1 2 3 4 5
do
	echo "$i Begining to make updates and upgrades this shouldnt take long"
	sleep $i
	$upgy
	continue 

done


echo "Do you want to remove snaps from this system?"
echo "y, Yes"
echo "n, No"

read CHOICE

if [ "$CHOICE" =  y ]
	for i in 5
	do
		echo "Removing snapd"
		sleep $i
		$rem snapd
		continue

	done

elif [ "$CHOICE" = n ]; then
	for i in 5
	do
		echo "Not Removing snapd"
		sleep $i
		continue

	done

else
	echo "Exiting...."
	exit


fi


echo "Installing build dependinces"
sleep 3
$build

echo "Do you want to install obs-studio and kdenlive?"
echo "y, Yes"
echo "n, No"

read CHOICE

if [ "$CHOICE"= y ]; then
	for i in 5
	do
		echo "installing obs and kdenlive"
		sleep $i
		$obs && $kdenlive
		continue

	done

elif [ "$CHOICE"= n ]; then
	for i in 5
	do
		echo "Exiting...."
		sleep $i
		continue
	done

else
	echo "Exiting...."
	exit

fi


echo "Installing the full distro...."
sleep 3
$gnome

echo "Do you want to remove firefox?"
echo "y, Yes"
echo "n, No"
read Reply

if [ "$Reply" = y ]; then
	for i in 5
	do 
	     echo "Removing firefox"
	     sleep $i
	     $fire

	done

elif [ "$Reply" = n ]; then
	for i in 5
	do
		echo "Not Removing firefox"
		sleep $i
		continue

	done

else
	echo "Exiting...."
	exit

fi
	      
echo "Choose the web browser you want to install?[1|2|3|4|5|6|7|8|9|10|]"
echo "1, FireFox"
echo "2, chromium"
echo "3, qutebrowser"
echo "4, Brave"
echo "5, Brave-beta"
echo "6, Brave-dev"
echo "7, continue without any browser"
echo "8, exit"

read CHOICE

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
	   sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	   echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	   apt update -y 

	   apt install brave-browser -y 

elif [ "$CHOICE" = 5 ]; then
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg arch=amd64] https://brave-browser-apt-beta.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-beta.list
	apt update -y 
	apt install brave-browser-beta -y 

elif [ "$CHOICE" = 6 ]; then
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list
	apt update -y
	apt install brave-browser-nightly -y

elif [ "$CHOICE" = 7 ]; then
	$skip_str


else
	exit

fi


echo "You need to reboot to see the changes"
echo "Would you like to reboot now or later? [|1|2|]"
echo "1, Reboot"
echo "2, Later"

read CHOICE 

if [ $CHOICE = 1 ]; then
	echo "Rebooting now in 3 seconds"
	sleep 3
	reboot

else
	echo "Rebooting later...."
	exit

fi 






































