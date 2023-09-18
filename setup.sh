#!/bin/sh


if [ "$USER" != "root" ]
then
	echo "Please run the script as root user"
fi

apt update

apt upgrade -y 

apt autoremove

apt clean

apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential

systemctl enable ssh --now

su kali && python3 -m pip install --upgrade pip

su kali && python3 -m pip install --upgrade pwntools

git clone https://github.com/pwndbg/pwndbg

cd pwndbg && ./setup.sh

apt install ghidra

apt-get install -y kali-desktop-xfce xorg xrdp

sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini

systemctl enable xrdp --now

apt install docker.io

apt install seclists

shutdown -r now
