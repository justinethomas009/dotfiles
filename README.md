# Awesome Dotfiles

Extensive customization of ZSH, TMUX, Vim and Spacemacs.

#### This is how my terminal looks like
![alt
text](https://github.com/justinethomas/dotfiles/blob/master/terminal_settings/my_term_setup.png "This how my setup looks like")

## Setup Options

There's 3 ways in which you can use this, depending on how much you think you'll be customizing.

But I strongly suggest that you fork the master branch and then clone this into your system, as some of the changes I do may cause your terminal to break.

One of the key features is that this implementation stays in sync across all your machines.
So depending on how much you'd like to customize your configuration, you have a few options:

* Little Customization: Just clone this repo and jump to [Installation](#installation).
* Mild Customization: [Fork]() this repo, and clone your own fork.
Keep an eye on this repo for bugfixes and other improvements that you'd like to incorporate into your fork.
Then jump to [Installation](#installation).
* Most Customization: Building your own dotfiles from scratch!
Read through these docs, watch the video above, star this repo, and create your own dotfiles!
You can add this repository as a [git module](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and source the parts you like.

If you're unsure, just read the docs, watch the video, clone this repository, and jump to [Installation](#installation).

## Installation

Planning to use a seperate dotfile manager for installation purpose.
But the master branch can be installed using the provided `deploy` script.

# Sumary of Changes

## Basic runtime opperations

All default dotfiles (`.zshrc`, `.vimrc`, etc) source something within the dotfiles repository.
This helps separate changes that are synced across all your machines with system specific changes.

Upon launching a new shell, the first thing that's evaulated is `zshrc_manager.sh`. This script first launches tmux.
Then once zsh logs in, within tmux, it updates the dotfiles repository, and sources the changes.

## [Zsh](https://en.wikipedia.org/wiki/Z_shell)

* `cd` has been reassigned to `cd` and `ls` and `ls` has been aliased to `ls -l`. Every time you navigate to a new directory, it will display the contents of that directory.

### Prompt

The Prompt which I am using is Powerlevel9k which works on my Mac, but for some reason it was not working in my Ubuntu Virtual Machine. So on Linux the shell defaults to this custom Prompt.

But the zshrc.sh has all my settings in it so you can work on it yourself. Anyway both Powerlevel9K and the custom prompt gives almost the same information like time to execute etc.

The prompt takes on the form:

```
[plugin, plugin, ...]:
```

Each plugin is sensitive to where you are and what you're doing, they reveal themselves when it's contextually relevant. Plugins include:

* `PWD plugin`: always present, tells you where you are. Always the first plugin.
* `Status code plugin`: appears anytime a program returns with a non-zero status code. Tells you what status code the program completed with.
* `Git plugin`: appears when you're in a git repository. Tells you what branch you're on, and how many files have been changed since the last commit.
* `Sudo plugin`: tells you when you can sudo without a password. Or when you're logged in as root.
* `Time plugin`: appears when a program took more than 1s to execute. Tells you how long it took to execute.
* `PID plugin`: appears when you background a task. Tells you what the PID of the task is.

### Keybindings
| Key Stroke | What It Does |
|------------|--------------|
| Ctrl-G     | Runs ``git add -A; git commit -v && git push`` |

### Plugins

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Searches your history while you type and provides suggestions.
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/ad522a091429ba180c930f84b2a023b40de4dbcc): Provides fish style syntax highlighting for zsh.
* [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3): Borrowed things like tab completion, fixing ls, tmux's vi-mode plugin.
* [vimode-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode) allows you to hit `esc` and navigate the current buffer using vim movement keys.
* There is a `script` folder where you can copy paste custom shell scripts to
  use it directly from the terminal. No more typing the full path of your
  custom script. Just make sure the scripts have executable permissions. You
  can do that by `sudo chmod 755 filename`

## [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor))

* I use [Vim-Plug](https://github.com/junegunn/vim-plug) for all my plugin installation. And the `deploy` script would
  have already installed all the plugins. You are free to modify the
  `plugins.vim` file in the folder and comment out the plugins you don't want to
  install beforehand, that way Vundle won't download it in the first place.
* The vim folder also has a `en.utf-8.add` file which will be your custom
  dictionary.

### Vim custom Keybindings
| Key Stroke | What It Does |
|------------|--------------|
| `<leader>g   `  | [YCM](https://github.com/Valloric/YouCompleteMe) goto defination or declaration |
| `<leader>r   `  | Show interactively what you are searching to [replace](https://github.com/osyo-manga/vim-over) |
| `<leader>u   `  | Toggle [undo tree](https://github.com/simnalamburt/vim-mundo) |
| `<leader>T   `  | Use [Command-T](https://github.com/wincent/command-t) for searching |
| `<leader>t   `  | Toggle [tagbar](https://github.com/majutsushi/tagbar) |
| `<leader>s   `  | Use [Ag(the silver searcher)](https://github.com/brookhong/ag.vim) to search for a pattern in your directory |
| `<leader>ev   `  | Edit your vimrc.vim file in dotfiles |
| `<leader>ep   `  | Edit your plugins.vim file in dotfiles |
| `<leader>bt  `   | Toggle [buffer explorer](https://github.com/jlanzarotta/bufexplorer) |
| `<leader>rf  `   | For [Renaming files](https://github.com/qpkorr/vim-renamer) in vim |
| `<leader>/  `   | For clearing highlighted search |
| `<leader>c<space>  `   | To toggle [commenting of lines](https://github.com/scrooloose/nerdcommenter) |
| `<ctrl-space>`   | To do [Ultisnips](https://github.com/SirVer/ultisnips)snippet expansion  |
| `<ctrl-n>    `  | [NerdTree](https://github.com/scrooloose/nerdtree) toggle |

###

| [Multi Cursor Editing](https://github.com/terryma/vim-multiple-cursors)| &nbsp;|
|---|---|
| `<ctrl-m>` or `<CR>`   | To edit same words or visual selections simultanously  |
| `<ctrl-x>`   | To skip word selection  |
| `<ctrl-p>`   | To go to previous word selection  |

### Vim Plugins

* Use `:ClearRegister` to wipe Vim registers
* `:ClangFormat` to [format C/C++ code](https://github.com/rhysd/vim-clang-format).
* `ryanoasis/vim-devicons` needs patched font. [Download](https://github.com/ryanoasis/nerd-fonts)
* [Vim-easymotion](https://github.com/easymotion/vim-easymotion) is available
* [Vim-fugitive](https://github.com/tpope/vim-fugitive) for git integration


`<leader>` is mapped to `,`

## [Tmux](https://en.wikipedia.org/wiki/Tmux)

* Ctrl-B has been remapped to the backtick character (&#96;). If you want to type the actual backtick character (&#96;) itself, just hit the key twice.
<!-- * `%` has been remapped to `v`. -->
* Use vim movement keys for moving between panes.
* Copy buffer is copied to xclip.
* Status bar tells you date, time, user, and hostname. Especially useful with nested ssh sessions.
* Execute `split_panes` in your shell to split your window into 4 panes.

## Fonts

* The `fonts` folder contains pre patched fonts from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).
* The fonts provided has its own license.

## Terminal Settings

* The `terminal_settings` folder contains my color scheme and my custom
  background image(it's actually my name. I wrote on a piece of paper and did
  some photoshop)

## Spacemacs

* I am trying out Spacemacs into my main workflow.

## Uninstall

Right now `uninstall` manages it. But soon will be deprecated in favour of a dotfile manager.

## License
This project is licensed under MIT.
See LICENSE for more details.
Please fork, contribute and share.
