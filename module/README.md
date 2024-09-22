# Script: polybar-locket

Connect with your friends and share your thoughts on their polybar!
Supports [Nerd Fonts](https://www.nerdfonts.com/) for extra fun

![example is coming soon](screenshots/1.png)


## Dependencies

- `curl`

- `zenity`

## Installation

- run `./install.sh`, installation is pretty straightforward (I hope). The moment the installation is finished, you'd receive your *id* that you can share with your friend

- fill in your friend's *id* in `config.conf`

- add the [module](#module) to your **polybar config**

- (optional) force zenity to pop up in floating mode in your wm config for a smoother experience

- have fun!


## Configuration

The `config.conf` file is responsible for tweaking your connection. There is only one option to tweak - just add friend's id to your file and see what they have in mind!


## Usage

When the automatic registration is complete and you have your `id`, share it with your friend to fill the `friend_id` field of `config.conf`. Do the same with their `id` in your configuration file.

Initially, your message would be an empty string. To update it simply left-click the locket icon, you'll be prompted to enter what you want to share. 

No need to worry about your details, they are stored locally on your machine, in the `config.conf` to be exact, where you can also check your `id` if you forgot it.


## Module

```ini
[module/locket]
type = custom/script
exec = ~/.config/polybar/modules/locket/polybar-locket.sh
format = <label>
format-prefix = "\#1 "
interval = 2
click-left = ~/.config/polybar/modules/locket/polybar-locket.sh update
```