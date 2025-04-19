{
  outputs,
  userConfig,
  pkgs,
  ...
}: {
  imports = [
    ../programs/aliases.nix
    ../programs/bash.nix
    ../programs/btop.nix
    ../programs/fastfetch.nix
    ../programs/fzf.nix
    ../programs/git.nix
    ../programs/kitty.nix
    ../programs/nextcloud.nix
    # ../programs/spicetify.nix
    # ../programs/starship.nix
    # ../programs/tmux.nix
    # ../programs/wofi.nix # maybe swap with rofi??
    # ../programs/zoxide.nix
    ../programs/zsh.nix
    ../services/tailscale.nix
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
      dig # dns lookup util
      du-dust # rust based disk util
      eza # alias to ls
      fd # alternative to find
      jq # query against json
      tldr
      kubectl
      lazydocker # TUI for docker
      nh # customizations available
      pipenv
      python3
      ripgrep # rg for recursive file content search
      vscodium
      hyfetch
      obsidian
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
      wl-clipboard
    ];

  # Catpuccin flavor and accent
  catppuccin = {
    flavor = "mocha";
    accent = "lavender";
  };
  news.display = "silent";
}
