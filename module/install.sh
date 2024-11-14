#!/bin/sh

# init
# config defaults
echo "friend_id=" > config.conf

echo "enter your locket password: " 
read -r password

echo "password=$password" >> config.conf

response=$(curl -s --json "{\"password\": \"$password\"}" http://cut-usual.gl.at.ply.gg:58289/api/v1/user)
echo "id=$response" >> config.conf

echo "your id is: $response. now share it with friends!"
echo "password and id are saved to config.conf"

#installation
mkdir -p ~/.config/polybar/modules/locket
cp -r ./* ~/.config/polybar/modules/locket
rm -rf ~/.config/polybar/modules/locket/.git ~/.config/polybar/modules/locket/README.md ~/.config/polybar/modules/locket/install.sh

echo "--installation complete--"