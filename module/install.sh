#!/bin/sh

# init

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# config defaults
echo "friend_id=" > config.conf
read -p "enter your locket password: " password
echo "password=$password" >> config.conf


response=$(curl -s --json "{\"password\": \"$password\"}" http://cubercube.ru:8080/api/v1/user)
echo "id=$response" >> config.conf

echo -e "your id is: \033[31m$response\033[0m. now share it with friends!"
echo -e "${RED}password${NC} and ${RED}id${NC} are saved to ${GREEN}config.conf${NC}"

#installation
mkdir -p ~/.config/polybar/modules/locket
cp -r ./* ~/.config/polybar/modules/locket
rm -rf ~/.config/polybar/modules/locket/.git ~/.config/polybar/modules/locket/README.md ~/.config/polybar/modules/locket/install.sh

echo -e "${GREEN}installation complete${NC}"