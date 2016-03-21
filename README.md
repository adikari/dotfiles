# Dotfiles

## What is this?

As I am working between multiple machines, it took me days trying to set up my dev machine everytime I moved to a new computer. I wanted to centralize all my configurations and set up my dev tools quickly and automatically with just running a single script.

This dotfiles has various tools, plugins, key-bindings and configurations that I have written and improved or sourced over years. This dotfiles has tons of sensible and useful configurations and bindings for tmux, vim and zsh, some of them being must haves.

## Dependencies

Currently this dotfiles depends on the following. If you have dependencies missing you will be asked to install it during installation.

### Mandatory
1. Vim 7.4 with python support
2. zsh shell

### Optional
Eventhough these are optional, I highly recommend to install. If you continue without these dependencies, functionality dependent on them will not be installed.

1. ctags
2. phpcs
3. fortune
4. cmake
5. npm


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
This dotfiles uses [oh-my-zsh] for the configuration of zshell. Visit its official github page for more details. You can view the zsh configuration in this [file](https://github.com/adikari/dotfiles/blob/master/zsh/zshrc). It is not recommended to edit the original file to add your own configuration as you will lose all your changes next time you update this dotfiles.

To add your own zsh configuration, create a file `my_zshrc` in your home with your custom configs. `~/.my_zshrc` is sourced from the main configuartion.

### 2. [Git config]
The dotfiles also sets up some git configurations. If the global username and email is not set up already, you will be prompted to enter your username and password in while installing dotfiles.

Following are the configurations set:
```
user.name = your username
user.email = your email
core.filemode = false
core.editor = vim
color.ui = true
log.date = relative
format.pretty = format:%C(yellow)%h %Cblue %ad %Cgreen %aN%Cred%d %Creset%s
diftool.prompt = false
```
Feel free to update the config or add more if you wish to after the installation.

### 3. [Tmux]
The dotfiles also sets up some tmux configuration. You can disregard this if you don't use tmux as this will have no affect. Make sure to install tmux if you wish to take advantage of this.

**Note**: Tmux by default uses `Ctrl+b` for inputting commands. This dotfile uses `Ctrl+a`.

The key bindings set are as follows:

#### Panes / Window Control
```
|    vertical split
-    horizontal split
h    select pane left
j    select pane down
k    select-pane up
l    select-pane right
```

#### Window Control
```
C-h  previous window
C-l  next window
```

#### Statusline
Tmux statusline is set used [vim-airline]. If you don't see the statusline, you might have to vim once.

For all other default tmux kep-bindings, check [tmux cheatsheet](https://gist.github.com/MohamedAlaa/2961058).

#### 4. [Vim]
I will update the documentation with all the installed plugins and key bindings soon.

## TODOS
1. Add detailed documentation about vim functionalities
2. Add screenshots of the dev environment
2. Based upon optional dependency, disable some zsh plugins


I am at the moment working on detailed documentation on each features that will be added by installing this project.

If you have any issues, please contact me at me@subash.com.au.

[vim-airline]: https://github.com/vim-airline/vim-airline
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[Vim]: http://www.vim.org/
[Git config]: http://git-scm.com/docs/git-config
[Tmux]: https://tmux.github.io/
