#!/bin/sh

source $HOME/.config/polybar/modules/locket/config.conf

if [ "$1" = "update" ]; then
    new_message=$(zenity --entry --title="Update Locket Message" --text="Enter your new message:")
    if [ -n "$new_message" ]; then
        curl -s --json "{\"password\": \"$password\", \"message\": \"$new_message\"}" http://cubercube.ru:8080/api/v1/user/$id/msg
    fi
else
    # This is the normal output for the polybar module
    echo "$(curl -s http://cubercube.ru:8080/api/v1/user/$friend_id) "
fi