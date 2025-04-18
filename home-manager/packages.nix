{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # CLI Utilities
    curl
    vim
    git
    wget
    htop
    tldr
    neofetch

    # Terminal
    zsh
    kitty
    tmux
    zellij

    # GUIs
    firefox
    vscodium
    obsidian

    # Server
    syncthing
    nextcloud-client
  ];
}