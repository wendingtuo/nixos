```sh
nix-shell -p git --command "git clone https://github.com/wendingtuo/nix-config.git"
cd nix-config
sudo nixos-rebuild switch --impure --flake .#hostname
home-manager switch --flake .#user@hostname
```

or maybe `nix-shell -p git --command "nix run --experimental-features 'nix-command flakes' github:wendingtuo/nix-config"`?


# Manual Steps
1. Set up wireguard in networkmanager
2. Login to Nextcloud
3. Login to firefox
4. Set up syncthing and obsidian


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
