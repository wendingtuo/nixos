{ config, pkgs, ... }:

let
  myAliases = {
    la = "ls -la";
  };

in
{
  # home-manager basic configuration
  home.username = "blake";
  home.homeDirectory = "/home/blake";
  home.stateVersion = "24.11"; # Do not change
  programs.home-manager.enable = true;
  news.display = "silent";

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = (with pkgs; [
    # Terminal
    zsh
    kitty
    tmux
    zellij

    # CLI Utilities
    bottom
    ffmpeg
    imagemagick
    neofetch

    # GUIs
    firefox
    vscodium

    # Server
    syncthing
    nextcloud-client
  ]);

  # Files
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Variables
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Programs
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.git = {
    enable = true;
    userName = "blake";
    userEmail = "blakehyatt@pm.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Services
  services.syncthing.enable = true;
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
