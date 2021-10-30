function vscode() {
    sudo apt install -y git python gcc g++ make libx11-dev libxkbfile-dev fakeroot rpm libsecret-1-dev
    sudo apt install -y nodejs npm
    git clone https://github.com/Microsoft/vscode.git
    cd vscode
    wget https://github.com/futurejones/code-oss-aarch64/raw/master/patches/v1.44.2/add_extensions.patch
    git apply add_extensions.patch
    yarn && yarn run gulp vscode-linux-arm64 && yarn run gulp vscode-linux-arm64-build-deb
}

function chromium() {
    echo "Removing distribution provided chromium packages and dependencies..."
    apt purge chromium* chromium-browser* snapd -y -qq && apt autoremove -y -qq
    sudo apt purge chromium* chromium-browser* -y -qq && apt autoremove -y -qq
    apt update -qq; apt install software-properties-common gnupg --no-install-recommends -y -qq
    echo "Adding Debian repo for Chromium installation"

    echo "deb http://ftp.debian.org/debian buster main
    deb http://ftp.debian.org/debian buster-updates main" >> /etc/apt/sources.list

    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A

    apt update -y
    apt install chromium -y

    sed -i 's/chromium %U/chromium --no-sandbox --test-type %U/g' /usr/share/applications/chromium.desktop
}

function remove_cromium() {
    echo "Removing distribution provided chromium packages and dependencies..."
    apt purge chromium* chromium-browser* snapd -y -qq && apt autoremove -y -qq
    sudo apt purge chromium* chromium-browser* -y -qq && apt autoremove -y -qq
    echo "Adding Debian repo for Chromium installation"
}

function roblox() {
    sudo apt install -y git python3-pip python3-setuptools python3-wheel python3-dev pkg-config 
    sudo apt install -y libcairo2-dev gtk-update-icon-cache desktop-file-utils xdg-utils libgirepository1.0-dev gir1.2-gtk-3.0

    git clone https://gitlab.com/brinkervii/grapejuice.git ~/grapejuice
    cd ~/grapejuice
    python3 ./install.py
}
function box86_64() {
    # box86 설치
    sudo apt-get install cmake git build-essential gcc -y
    sudo dpkg --add-architecture armhf
    sudo apt update -y
    sudo apt install -y gcc-arm-linux-gnueabihf libc6:armhf libncurses5:armhf libstdc++6:armhf

    git clone https://github.com/ptitSeb/box86
    cd box86
    mkdir build; cd build; 
    cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
    make -j$(nproc)
    sudo make install

    #box86에 wine설치
    cd ~;
    mkdir ~/wine
    wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-5.19-upstream-linux-x86.tar.gz;
    tar -xf PlayOnLinux-wine-5.19-upstream-linux-x86.tar.gz -C ~/wine/

    echo "export BOX86_PATH=~/wine/bin/" >> ~/.profile
    echo "export BOX86_LD_LIBRARY_PATH=~/wine/lib/" >> ~/.profile
    echo "export BOX86_LOG=1" >> ~/.profile
}
function box86() {
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
}

function remove_box86() {
    cd ~
    rm -rf box86
    rm -rf wine
    echo ".profile remove text not success"
}

function ibus() {
    sudo apt install -y fonts-unfonts-core fonts-nanum ibus-hangul
}
echo "termux ubuntu program installer."
echo "double number is remove(ex. 1 install 11 remove)"
echo "1. install ibus"
echo "2. install cromium"
echo "3. install vscode"
echo "4. install box86"
echo "5. install box86_64"
echo "6. install grapejuice(roblox studio)"

echo -n "select number : "
read program
echo ""

if [ ${program} -eq 1 ]; then
    ibus
elif [ ${program} -eq 2 ]; then
    cromium
elif [ ${program} -eq 3 ]; then
    vscode
elif [ ${program} -eq 4 ]; then
    box86
elif [ ${program} -eq 5 ]; then
    box86_64
elif [ ${program} -eq 6 ]; then
    roblox
elif [ ${program} -eq 55 ]; then
    remove_box86
fi

