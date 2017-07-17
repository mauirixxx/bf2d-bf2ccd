#!/bin/bash
SUPW=$1
# supw is your password for sudo access, which is only needed if the script is ran locally
# for example: "./install_bf2d_bf2ccd.sh StrongPassWord!"
echo $SUPW | sudo yum install wget unzip screen glib2.i686 -y
mkdir files && cd files
wget https://raw.githubusercontent.com/mauirixxx/bf2d-bf2ccd/master/bf2server.xml
echo $SUPW | sudo mv bf2server.xml /etc/firewalld/services/
echo $SUPW | sudo restorecon /etc/firewalld/services/bf2server.xml
echo $SUPW | sudo chown root.root /etc/firewalld/services/bf2server.xml
echo $SUPW | sudo firewall-cmd --add-service=bf2server --permanent
echo $SUPW | sudo firewall-cmd --reload
wget http://download.bf2.us/servers/bf2.linux.server.tar.gz
#wget https://www.fullcontactwar.com/files/bf2.linux.server.tar.gz
tar -xvzf bf2.linux.server.tar.gz
mv server/ ~/bf2_server
cd ~/bf2_server/
rm pb
chmod u+x start.sh bin/amd-64/bf2
cd ~/files/
wget http://download.mono-project.com/archive/1.1.12.1/linux-installer/0/mono-1.1.12.1_0-installer.bin
chmod +x mono-1.1.12.1_0-installer.bin
echo $SUPW | sudo ./mono-1.1.12.1_0-installer.bin
# now just to verify it installed fine
/opt/mono-1.1.12.1/bin/mono -V
wget https://www.fullcontactwar.com/files/BF2CCD_1.4.2446.zip
unzip BF2CCD_1.4.2446.zip -d ~/bf2_server/
cd ~/bf2_server/
unzip modmanager-v1.4.zip
screen -A -m -d -S bf2server /opt/mono-1.1.12.1/bin/mono bf2ccd.exe
screen -x bf2server
