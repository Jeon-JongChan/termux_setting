# copy by https://gxmersam.blogspot.com thanks you
root=/data/data/com.termux/files
uroot=/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu
termux-setup-storage
# ****termux ubuntu 설치 및 설정 시작
pkg update -y && pkg upgrade && pkg install wget proot-distro pulseaudio -y
# termux sound set
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

# ubuntu alias 사라진듯
echo 'alias uboot="proot-distro login --user tab ubuntu"' >> ${root}/usr/etc/bash.bashrc
proot-distro install ubuntu
# ubuntu root에서 실행시킬 user 추가 스크립트 다운로드
cd ${uroot}/root
wget https://raw.githubusercontent.com/Jeon-JongChan/termux_setting/master/proot_ubuntu_user.sh && chmod +x proot_ubuntu_user.sh
# 지금까지 설치한 스크립트 삭제
cd ~
rm termux-prefix-switcher proot_switch.sh proot_distro.sh
proot-distro login ubuntu

# termux 권한 허용을 해줘야 이 스크립트는 작동할듯