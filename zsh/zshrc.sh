############################################################################
# Last Modified:    Sat 26 May 2018 03:29:36 AM IST
#
# This file is part of project name
# (see https://github.com/justinethomas/dotfiles)
# This file contains your zshrc settings
#
# Copyright (C) 2018, Justine T Kizhakkinedath
# All rights reserved
#
# Licensed under the term of MIT License
# See LICENSE file in the project root for full license information.
############################################################################

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
# Vars
  HISTFILE=~/.zsh_history
  SAVEHIST=1000
  setopt inc_append_history # To save every command before it is executed
  setopt share_history # setopt inc_append_history

# Settings
  export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

# #Functions
#   # Loop a command and show the output in vim
#   loop() {
#     echo ":cq to quit\n" > /tmp/log/output
#     fc -ln -1 > /tmp/log/program
#     while true; do
#       cat /tmp/log/program >> /tmp/log/output ;
#       $(cat /tmp/log/program) |& tee -a /tmp/log/output ;
#       echo '\n' >> /tmp/log/output
#       vim + /tmp/log/output || break;
#       rm -rf /tmp/log/output
#     done;
#   }

#   # Custom cd
#   c() {
#     cd $1;
#     ls;
#   }
#   alias cd="c"

alias ls="ls -la"

# For vim mappings:
  stty -ixon

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/plugins/oh-my-zsh/themes/agnoster.zsh-theme
ZSH_THEME="agnoster"

# if [ -n "$INSIDE_EMACS" ]; then
#     # export ZSH_THEME="rawsyntax"
#     # export ZSH_THEME="agnoster"
#     ZSH_THEME="agnoster"
# fi



# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#     source ~/dotfiles/zsh/prompt.sh
# elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Powerline for zsh
        source  ~/dotfiles/zsh/plugins/powerlevel9k/powerlevel9k.zsh-theme
    # Powerlevel on new line
        # POWERLEVEL9K_PROMPT_ON_NEWLINE=true
        # POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
    # New line after prompt
        POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
    # for contents on left and right
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs status root_indicator background_jobs command_execution_time newline os_icon)
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv vi_mode)
    # show error code
        POWERLEVEL9K_STATUS_OK=false
    # show raw error values
        POWERLEVEL9K_STATUS_HIDE_SIGNAME=true
    # display execution time
        POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
        POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2
    # customizing how it shows which vi mode I am in
        POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
        POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
    # using patched font
        POWERLEVEL9K_MODE='awesome-patched'
    # Shorten dir names
        # POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
        # POWERLEVEL9K_SHORTEN_DELIMITER=""
        # POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# fi


# refer this image https://misc.flogisoft.com/_media/bash/colors_format/256_colors_bg.png
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# export PATH=~/dotfiles/scripts:$PATH
# export PATH=/Users/justinethomas009/Library/Python/3.6/bin:$PATH

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
#   eval "$(pyenv virtualenv-init -)"
# fi

source ~/dotfiles/zsh/custom_functions.sh

add-to-path ~/dotfiles/scripts
add-to-path /Users/justine/Library/Python/3.6/bin
