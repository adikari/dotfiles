# Dotfiles

## What is this?

As I am working between multiple machines, it took me days trying to set up my dev machine everytime I moved to a new computer. I wanted to centralize all my configurations and set up my dev tools quickly and automatically with just running a single script.

This dotfiles has various tools, plugins, key-bindings and configurations that I have written and improved or sourced over years. This dotfiles has tons of sensible and useful configurations and bindings for tmux, vim and zsh, some of them being must haves.

## Dependencies

Currently this dotfiles depends on the following. If you have dependencies missing you will be asked to install it during installation.

Dependencies are automatically installed in osx or arch linux.

## How to set up

The setup of dotfiles is done using the `init.sh` script.

```sh
    $ cd ~
    $ git clone https://github.com/adikari/dotfiles.git
    $ cd dotfiles
    $ ./init
```

## Post setup

Calendar and Email sync requires Oauth tokens and have to be ran manually for the first time. After the initial token is received, it is refreshed automatically.

```
# get calendar token
vdirsyncer discover

# get email token
mailctl authorize microsoft <email address>

# google drive token
rclone config create gdrive@personal drive scope drive
rclone config # set password

# davmail
1. navigate to localhost:1080
2. enter username password and complete oauth setup
```
