echo "termux ubuntu program installer."
echo "double number is remove(ex. 1 install 11 remove)"
echo "1. install cromium"
echo "2. install vscode"
echo "3. install grapejuice(roblox studio)"

echo -e "select number : "
read program
echo ""

if [${program} -eq 1]; then
    echo "********** install cromium **********"
    cromium
elif [${program} -eq 11]; then
elif [${program} -eq 2]; then
    vscode
elif [${program} -eq 22]; then
elif [${program} -eq 3]; then
    echo "********** install roblox studio **********"
    roblox
elif [${program} -eq 33]; then
    echo "not remove"
elif [${program} -eq 4]; then
elif [${program} -eq 44]; then
fi

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

    git clone https://gitlab.com/brinkervii/grapejuice.git /tmp/grapejuice
    cd /tmp/grapejuice
    python3 ./install.py
}