# copy by https://gxmersam.blogspot.com thanks you
root=/data/data/com.termux/files
# ****termux ubuntu 설치 및 설정 시작
pkg update -y && pkg upgrade && pkg install proot-distro pulseaudio -y
# termux sound set
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

# ubuntu alias 사라진듯
echo 'alias uboot="proot-distro login --user tab ubuntu"' >> ${root}/usr/etc/bash.bashrc
proot-distro install ubuntu
proot-distro login ubuntu