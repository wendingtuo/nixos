{ outputs, userConfig, pkgs, ... }: 
{
  imports = [
    ../programs/aliases.nix
    ../programs/bash.nix
    ../programs/btop.nix
    ../programs/fastfetch.nix
    ../programs/firefox.nix
    ../programs/fzf.nix
    ../programs/git.nix
    ../programs/kitty.nix
    ../programs/nextcloud.nix
    # ../programs/spicetify.nix
    ../programs/starship.nix
    ../programs/syncthing.nix
    # ../programs/tmux.nix
    ../programs/vscodium.nix
    # ../programs/zoxide.nix
    ../programs/zsh.nix
  ];

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];
    config.allowUnfree = true;
  };

  # Home-Manager configuration for the user's home environment
  home = {
    username = "${userConfig.name}";
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${userConfig.name}"
      else "/home/${userConfig.name}";
  };

  # Ensure common packages are installed
  home.packages = with pkgs;
    [
      # Utilities
      dig # dns lookup util
      du-dust # rust based disk util
      eza # alias to ls
      fd # alternative to find
      jq # query against json
      tldr # simplified manuals
      nh # customizations available 
      ripgrep # rg for recursive file content search
      hyfetch # colorful system details fetcher
      yazi # TUI file explorer
      zellij
      
      # Containers and development
      kubectl
      kubernetes-helm
      minikube
      docker-compose
      lazydocker # TUI for docker
      pipenv
      python3
      
      # Apps and stuff
      obsidian
      alacritty
      tmux
    ]
    ++ lib.optionals stdenv.isDarwin [
      colima
      docker
      hidden-bar
      raycast
    ]
    ++ lib.optionals (!stdenv.isDarwin) [
      pavucontrol
      pulseaudio
      tesseract #OCR engine
      unzip
    ];

  # Catpuccin flavor and accent
  catppuccin = {
    flavor = "mocha";
    accent = "lavender";
  };
  news.display = "silent";
}
