# copy by https://gxmersam.blogspot.com thanks you
root=/data/data/com/termux/files
# 64bit > 32bit(x86) ( wine 설치할려면 필요 )
pkg update && pkg install proot-distro pulseaudio wget -y
wget https://raw.githubusercontent.com/WMCB-Tech/termux-prefix-switcher/master/termux-prefix-switcher
termux-prefix-switcher switch
# ****termux ubuntu 설치 및 설정 시작
pkg update && pkg upgrade && pkg install proot-distro pulseaudio -y
# termux sound set
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

# ubuntu alias 사라진듯
proot-distro install ubuntu
echo "alias uboot=proot-distro login --user tab ubuntu" > ${root}/usr/etc/bash.bashrc
proot-distro login ubuntu