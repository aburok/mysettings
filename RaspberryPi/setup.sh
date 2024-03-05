# Instal operating system
# https://www.raspberrypi.org/documentation/installation/installing-images/README.md

# change keybord layout to pl
# https://forum.dug.net.pl/viewtopic.php?pid=172632
setxkbmap pl

# map Caps Lock to Escape
#http://vim.wikia.com/wiki/Map_caps_lock_to_escape_in_XWindows#Xmodmap_comments_from_tip_285 
# This command turns the left Windows key into another Esc key. 
# Just add it to your ~/.bashrc to make the change permanent.
sudo nano ~/.bashrc
# ADD BELOW LINE
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# change password from raspberry
# https://www.raspberrypi.org/documentation/linux/usage/users.md
passwd

######################
######## WIFI ########
########################
# https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md
# scan available networks
sudo iwlist wlan0 scan
# look for EESID eg "My home wifi"

#open wifi config in nano
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
#add at the bottom of the file
# network={
#    ssid="testing"
#    psk="testingPassword"
# }

# reconfigure wlan interface 
wpa_cli -i wlan0 reconfigure

#check if IP address was assigned
ifconfig wlan0
#########################
##### /  WIFI ###########
#########################


#update and upgrade all packages
sudo apt-get update
# This may take a long time
sudo apt-get upgrade

# SHARE FOLDER WITH WINDOWS using Samba
# https://raspberrypihq.com/how-to-share-a-folder-with-a-windows-computer-from-a-raspberry-pi/
# on WINDOWS
//192.168.8.105/PiShare

# Install Vim 
sudo apt-get install -y vim-runtime
sudo apt-get install -y vim

# install nodejs and npm
sudo apt-get install -y nodejs-legacy
sudo apt-get install -y npm


#############################################################
#################### ARDUINO ###############################
#############################################################
# install Firmata and Arduino
# http://jvrbaena.github.io/blog/2013/07/14/node-dot-js-arduino-raspberry-pi/
sudo apt-get install -y arduino

#install Johhny-five / Javascript Framework for IoT
npm install johnny-five

sudo apt-get install -y serialport

# Display devices connected to USB
lsusb

#############################################################
#################### ARDUINO ###############################
#############################################################


