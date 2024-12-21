#### ThachCK setup guide

##### Commands to execute

```bash
# Cloning the dotfiles repository
git clone https://github.com/thachck/dotfiles.git

# Copy configurations
cd dotfiles
cp .* ~
cp -r .config ~
cp -r atuin ~/.local/share

# Install Rosetta
softwareupdate --install-rosetta --agree-to-license

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages (running in the same folder with Brewfile)
brew bundle install

# Install Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install zr plugins
zr Aloxaf/fzf-tab mroth/evalcache zdharma-continuum/fast-syntax-highlighting > ~/.config/zr.zsh
```

##### Additional applications/plugins

- Xcode
- rcmd (App Store)
- Safari extensions
  - Vimlike
  - Save to Raindrop.io

##### Additional setup guides

- https://www.git-tower.com/help/guides/integration/commit-tag-signing/windows
- https://developer.1password.com/docs/ssh/get-started/
