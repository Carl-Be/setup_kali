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

# start crackmapexec install
cd ~ 
rm $(which crackmapexec)

rm $(which cme)

apt-get install -y libssl-dev libffi-dev python-dev build-essential

git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec

cd CrackMapExec

poetry install

touch /etc/profile.d/00-aliases.sh

echo 'alias crackmapexec="poetry run -C ~/CrackMapExec crackmapexec"' >> /etc/zsh/zshrc

echo 'alias cme="poetry run -C ~/CrackMapExec crackmapexec"' >> /etc/zsh/zshrc

echo 'alias crackmapexec="poetry run -C ~/CrackMapExec crackmapexec"' >> /etc/bash.bashrc

echo 'alias cme="poetry run -C ~/CrackMapExec crackmapexec"' >> /etc/bash.bashrc
# end crackmapexec install

shutdown -r now
