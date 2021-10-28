# xfce4 and tigervnc install
 wget https://raw.githubusercontent.com/Jeon-JongChan/termux_setting/master/install/xfce.sh && chmod +x xfce.sh
./xfce.sh

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
