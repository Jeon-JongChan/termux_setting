# copy by https://gxmersam.blogspot.com thanks you
root=/data/data/com.termux/files
#uroot=/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu
uroot=~/ubuntu/ubuntu20-fs/
# ****termux ubuntu 설치 및 설정 시작
mkdir ubuntu
cd ubuntu
pkg install wget curl proot tar -y && wget https://raw.githubusercontent.com/tuanpham-dev/termux-ubuntu/master/ubuntu.sh && chmod +x ubuntu.sh
bash ubuntu.sh

# termux alias
echo 'alias uboot="~/ubuntu/start-ubuntu20.sh"' >> ${root}/usr/etc/bash.bashrc
echo 'alias uhome="cd ~/ubuntu/ubuntu20-fs/home/tab"' >> ${root}/usr/etc/bash.bashrc
# ubuntu root에서 실행시킬 user 추가 스크립트 다운로드
cd ${uroot}/home/tab
wget https://raw.githubusercontent.com/Jeon-JongChan/termux_setting/master/install/install_tool.sh && chmod +x install_tool.sh
# 지금까지 설치한 스크립트 삭제
# rm termux-prefix-switcher proot_switch.sh
echo 'vncserver -xstartup /usr/bin/startxfce4 -localhost no -depth 24 -name remote-desktop -AcceptSetDesktopSize=0 ${GEO} :${PORT}
echo "VNC server started. The default password is the account password for $USER"
' > ${uroot}/usr/local/bin/vnc
cd ~
start-ubuntu20.sh
