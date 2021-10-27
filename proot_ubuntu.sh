# copy by https://gxmersam.blogspot.com/. thanks you
# vnc 설치 및 gui 프로그램과 터미널 설치
# openbox는 저사양GUI로 코딩이나 웹 서치만 할 경우 유용하다 판단해서 냅둠
sudo apt install tigervnc-standalone-server openbox xterm -y
echo "rm ~/.vnc/localhost*; vncserver" > ~/vnc.sh; chmod +x ~/vnc.sh
# sound 설정
echo "export PULSE_SERVER=127.0.0.1" >> ~/.profile
# box86 설치
sudo apt-get install cmake git python3 build-essential gcc -y
git clone https://github.com/ptitSeb/box86
cd box86
mkdir build; cd build; 
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo
make 
sudo make install
#box86에 wine설치
cd ~;
mkdir ~/wine
wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-5.19-upstream-linux-x86.tar.gz;
tar -xf PlayOnLinux-wine-5.19-upstream-linux-x86.tar.gz -C ~/wine/

echo "export BOX86_PATH=~/wine/bin/" >> ~/.profile
echo "export BOX86_LD_LIBRARY_PATH=~/wine/lib/" >> ~/.profile
echo "export BOX86_LOG=1" >> ~/.profile
echo 'alias wboot="box86 wine"' >> ~/.profile

#기타 프로그램 설치
# 크로미움
sudo apt-get install chromium-browser
# VSCODE
curl -s https://packagecloud.io/install/repositories/swift-arm/vscode/script.deb.sh | sudo bash
sudo apt-get install code-oss