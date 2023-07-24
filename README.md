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

Thats all we need to do. The script will set up everything and prepare the environment.

The dotfiles will set up:

### 1. zsh
All the configurations and plugins for zsh in inside `zsh` directory.

### 2. [Git config]
The dotfiles also sets up some git configurations. Update the `configs/gitconfig` file to your liking. At least update the `[user]` section.

### 3. [Tmux]
The dotfiles also sets up some tmux configuration. Tmux configuration is inside `tmux` directory.

**Note**: Tmux by default uses `Ctrl+b` for inputting commands. This dotfile uses `Ctrl+a`.

#### 4. [NeoVim]
Neo vim configuration is inside `nvim` directory. 

If you have any issues, please contact me at me@subash.com.au. Feel free to clone and modify the repo.
