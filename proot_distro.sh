# copy by https://gxmersam.blogspot.com thanks you
root=/data/data/com.termux/files
uroot=/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu
# ****termux ubuntu 설치 및 설정 시작
mkdir ubuntu
cd ubuntu
pkg install wget curl proot tar -y && wget https://raw.githubusercontent.com/tuanpham-dev/termux-ubuntu/master/ubuntu.sh && chmod +x ubuntu.sh
bash ubuntu.sh


# ubuntu alias 사라진듯
echo 'alias uboot="~/ubuntu/start-ubuntu20.sh"' >> ${root}/usr/etc/bash.bashrc
# ubuntu root에서 실행시킬 user 추가 스크립트 다운로드
# cd ${uroot}/root
# wget https://raw.githubusercontent.com/Jeon-JongChan/termux_setting/master/proot_ubuntu_user.sh && chmod +x proot_ubuntu_user.sh
# 지금까지 설치한 스크립트 삭제
start-ubuntu20.sh
# cd ~
# rm termux-prefix-switcher proot_switch.sh
# proot-distro login ubuntu