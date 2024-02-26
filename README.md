# Dotfiles

## What is this?

As I am working between multiple machines, it took me days trying to set up my dev machine everytime I moved to a new computer. I wanted to centralize all my configurations and set up my dev tools quickly and automatically with just running a single script.

This dotfiles has various tools, plugins, key-bindings and configurations that I have written and improved or sourced over years. This dotfiles has tons of sensible and useful configurations and bindings for tmux, vim and zsh, some of them being must haves.

## Dependencies

Currently this dotfiles depends on the following. If you have dependencies missing you will be asked to install it during installation.

Dependencies are automatically installed in osx

### Mandatory

1. NeoVim
2. zsh shell

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

## SSH and GPG keys

1. GPG keys are in 1 password

```
op document list
op document get <public_key_id> --out-file public_key
op document get <private_key_id> --out-file private_key
gpg --import private_key
gpg --import public_key
```

2. Get github ssh keys
Create `~/.ssh/github_id_rsa` and `~/.ssh/github_id_rsa.pub`
Copy the content of keys from 1 password then add it in the file
Update the ssh key permissions

```
chmod 600 ~/.ssh/github_id_rsa
chmod 644 ~/.ssh/github_id_rsa.pub
```

## Adding printer

1. Open cups administration http://localhost:631/admin. Enter operating system username and password
2. Add a new printer

```
Description:	Brother MFC-L2800DW
Location:	Office
Driver:	Brother MFC-L2710DW series, using brlaser v6 (grayscale, 2-sided printing)
Connection:	lpd://192.168.0.2/BINARY_P1
Defaults:	job-sheets=none, none media=iso_a4_210x297mm sides=two-sided-long-edge
```

## Enrolling finger print

1. Register right index finger

```
fprintd-enroll

# verify
fprintd-verify
```

2. Register left index finger

```
fprintd-enroll -f left-index-finger

# verify
fprintd-verify -f left-index-finger
```


