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

  if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  # Include local functions/aliases/environments:
  zsh_dotfiles=$(find "${HOME}/.zsh_custom" -name '*.zsh')
  for f in "${zsh_dotfiles[@]}";do
      if [ -f "$f" ]; then
          ln -sf "$f" "${HOME}/.oh-my-zsh/custom/"
      fi
  done

  if [ -d "$HOME/.iterm2" ]; then
    echo "Setting iTerm preference folder"
    defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.iterm2"
  fi

  # Install Neovim python module
  python3 -c "import pynvim" || pip3 install pynvim

fi
