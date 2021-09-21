#!/usr/bin/env bash

cd "$HOME" || exit

echo "Init submodules"
yadm submodule update --recursive --init

system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then

  # install homebrew if it's missing
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if [ -f "$HOME/.Brewfile" ]; then
    echo "Updating homebrew bundle"
    brew bundle --global
  fi

  # Create cronjob
  if [ $(crontab -l | grep -c brew ) -eq 0 ]; then
    (
      crontab -l
      echo "0 */3 * * * brew bundle dump --force --file ~/.Brewfile"
    ) | crontab -
  fi

  if [ -d "$HOME/.iterm2" ]; then
    echo "Setting iTerm preference folder"
    defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.iterm2"
  fi

  # Install Neovim python module
  python3 -c "import pynvim" || pip3 install pynvim

fi
