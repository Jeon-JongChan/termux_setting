# copy by https://gxmersam.blogspot.com/. thanks you
apt update -y && apt install sudo -y
adduser tab
echo "tab ALL=(ALL:ALL) ALL" > /etc/sudoers
su - tab