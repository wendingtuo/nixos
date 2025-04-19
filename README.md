```sh
nix-shell -p git
git clone https://github.com/wendingtuo/nix-config.git
cd nix-config
sudo nixos-rebuild switch --flake .#hostname
home-manager switch --flake .#user.hostname
```

#TODO
- [ ] Additional DM (Sway? Hyprland?)
- [ ] vscodium
  - [ ] extensions
  - [ ] customizations
- [ ] Agenix key management
- [ ] catppuccin / dracula theme
- [ ] file manager
  - yazi
  - nnn
  - mc (midnight commander)
- [ ] zathura (pdf editor)
- [ ] firefox
  - [ ] sync -or-
  - [ ] bitwarden, raindrop, remove pocket, set good defaults
- [ ] Wireguard default config
- [ ] vmshare
- [ ] gnome extensions and gtk
  - [ ] Tiling Shell
  - [ ] Open Bar
  - [ ] User Themes
  - [ ] Enhanced Overview
  - [ ] Dracula GTK
  - [ ] Dracula Cursor
- [ ] dotfiles
  - [ ] kitty
  - [ ] starship
  - [ ] tmux / zellij
- [ ] obsidian setup
- [ ] tailscale
- [ ] nextcloud setup
- [ ] fzf
- [ ] git
- [ ] ripgrep, fd, zoxide?
- [ ] btop, btm (bottom)
- [ ] fastfetch? hyfetch?
- [ ] spotify and spicetify?
