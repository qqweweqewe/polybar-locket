#!/bin/sh

source $HOME/.config/polybar/modules/locket/config.conf

echo $(curl -s http://cubercube.ru:8080/api/v1/user/$friend_id)