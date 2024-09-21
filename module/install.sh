#!/usr/bin/env bash

# init

read -p "enter your locket password: " password
echo "password=$password" >> config.conf

echo "now remember your password carefully! there is no way of restoring it yet"

# Send a POST request to the API and store the response
response=$(curl --json '{"password": "ass"}' http://cubercube.ru:8080/api/v1/user)

# Append the response to config.conf
echo "id=$response" >> config.conf

echo "your id is: $response. now share it with friends!"

#installation
mkdir -p ~/.config/polybar/modules/locket
cp -r ./* ~/.config/polybar/modules/locket
rm -rf ~/.config/polybar/modules/locket/.git ~/.config/polybar/modules/locket/.gitignore ~/.config/polybar/modules/locket/install.sh
