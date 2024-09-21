#!/bin/sh

# init

# config defaults
echo "friend_id=" > config.conf
read -p "enter your locket password: " password
echo "password=$password" >> config.conf

echo -e "now remember your password carefully! it is needed to update messages. \033[31mthere is no way of restoring it yet\033[0m"

response=$(curl -s --json '{"password": "ass"}' http://cubercube.ru:8080/api/v1/user)
echo "id=$response" >> config.conf

echo -e "your id is: \033[31m$response\033[0m. now share it with friends!"

#installation
mkdir -p ~/.config/polybar/modules/locket
cp -r ./* ~/.config/polybar/modules/locket
rm -rf ~/.config/polybar/modules/locket/.git ~/.config/polybar/modules/locket/.gitignore ~/.config/polybar/modules/locket/install.sh

echo "export PATH=$PATH:$HOME/.config/polybar/modules/locket/" >> .