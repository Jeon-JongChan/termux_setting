# copy by https://gxmersam.blogspot.com/. thanks you
apt update -y && apt install sudo -y
adduser tab
echo "tab ALL=(ALL:ALL) ALL" > /etc/sudoers
# 미리 설치할 파일 다운로드
cd /home; mkdir tab; cd tab
wget https://raw.githubusercontent.com/Jeon-JongChan/termux_setting/master/proot_ubuntu.sh
chown tab:tab proot_ubuntu.sh
chmod 755 proot_ubuntu.sh

su - tab