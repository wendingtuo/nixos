```sh
nix-shell -p git --command "git clone https://github.com/wendingtuo/nixos.git"
cd nixos
sudo nixos-rebuild switch --impure --flake .#nixvm
home-manager switch --flake .#nixvm
```

# Manual Steps
1. Modify /etc/nixos/hardware-configuration to include shares for vmware
2. Set up wireguard in networkmanager
3. Login to Nextcloud
4. Login to firefox
5. Set up syncthing and obsidian


#TODO
- [ ] Additional DM (Sway? Hyprland?)
- [ ] Agenix key management
- [ ] zathura (pdf editor)
- [ ] dotfiles
  - [ ] kitty
  - [ ] starship
  - [ ] tmux / zellij
- [ ] gnome
  - [ ] Open Bar
- [ ] spotify and spicetify?
- [x] vscodium
  - [x] extensions
  - [x] customizations
- [x] file manager | yazi
  - yazi
    - dracula theme
  - nnn
  - mc (midnight commander)
- [x] firefox
  - [/] sync -or-
  - [x] bitwarden, raindrop, remove pocket, set good defaults
- [x] Wireguard default config
- [x] vmshare
- [x] gnome extensions and gtk
  - [x] Tiling Shell
  - [x] User Themes
  - [x] Dracula GTK
  - [x] Dracula Cursor
- [x] gnome customizations
  - [x] disable lockscreen (power options?)
  - [x] dark theme
- [x] obsidian setup
- [x] tailscale
- [x] nextcloud setup
- [x] fzf
- [x] git
- [x] ~~ripgrep, fd,~~ zoxide?
- [x] btop, btm (bottom)
- [x] fastfetch? hyfetch?
