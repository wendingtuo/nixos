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
- [x] firefox
  - [/] sync -or-
  - [x] bitwarden, raindrop, remove pocket, set good defaults
- [x] Wireguard default config
- [x] vmshare
- [ ] gnome extensions and gtk
  - [x] Tiling Shell
  - [ ] Open Bar
  - [x] User Themes
  - [ ] Enhanced Overview
  - [ ] Dracula GTK
  - [ ] Dracula Cursor
- [x] gnome customizations
  - [x] disable lockscreen (power options?)
  - [x] dark theme
- [ ] dotfiles
  - [ ] kitty
  - [ ] starship
  - [ ] tmux / zellij
- [x] obsidian setup
- [x] tailscale
- [x] nextcloud setup
- [x] fzf
- [x] git
- [x] ~~ripgrep, fd,~~ zoxide?
- [x] btop, btm (bottom)
- [x] fastfetch? hyfetch?
- [ ] spotify and spicetify?
