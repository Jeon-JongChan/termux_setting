# origin : https://github.com/tuanpham-dev/termux-ubuntu/blob/master/xfce.sh
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:xubuntu-dev/staging -y
sudo apt update -y
sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
sudo apt install keyboard-configuration -y
sudo apt install tzdata -y
sudo apt install inetutils-tools dialog -y
sudo apt install xfce4 xfce4-goodies xfce4-terminal tigervnc-standalone-server tigervnc-common dbus-x11 ffmpeg language-pack-en --no-install-recommends -y
sudo apt --fix-broken install
sudo apt clean

mkdir -p ~/.vnc

# tigervnc 시작시 실행할 명령어 설정
echo '#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY
LANG=en_US.UTF-8
export LANG
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session startxfce4 &' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo "export DISPLAY=":1"" >> /etc/profile
# tigervnc 편의를 위한 설정 - .profile
# vnc 명령어
touch /usr/local/bin/vnc && chmod +x /usr/local/bin/vnc
echo 'LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver -localhost no -depth 24 -name remote-desktop -AcceptSetDesktopSize=0 $GEO :$PORT
echo "VNC server started. The default password is the account password for $USER"
' >> /usr/local/bin/vnc

echo '
export PORT=1
CHOICE=1
if [$1 -ne ""]; then
    CHOICE=$1
fi
case $CHOICE in
	1)
		echo "You chose dynamic resolution"
		GEO="" vnc
		;;
	2)
		echo "You chose QHD resolution"
		GEO="-geometry 2560x1440" vnc
		;;
	3)
		echo "You chose Full HD resolution"
		GEO="-geometry 1920x1080" vnc
		;;
	4)
		echo "You chose HD-ready resolution"
		GEO="-geometry 1280x720" vnc
		;;
	5)
		echo "You chose to manually provide a resolution/port"
		echo "Input your custom resolution in format WIDTHxHEIGHT i.e 1920x1200"
		read custom
		echo "Input your custom port i.e 2"
		read port
		GEO="-geometry $custom" PORT=$port vnc 
		;;
esac
' >> /usr/local/bin/vncserver-start

echo '
if [ ! -z `which vncserver` ]; then
  GEO="" PORT=1 vnc
fi

exit() {
  pkill dbus
  pkill ssh-agent
  pkill gpg-agent
  pkill pulseaudio

  if [ ! -z `which vncserver` ]; then
    vncserver -kill :1
  fi
  
  #unset LD_PRELOAD
  unset -f exit
  exit
}' >> ~/.profile


# vnc password 설정
read -sp 'Provide a new VNC password: ' PASSWORD
/usr/bin/vncpasswd -f <<<"$PASSWORD"$'\n'"$PASSWORD" > $HOME/.vnc/passwd
echo ""
echo "Password for VNC changed"

