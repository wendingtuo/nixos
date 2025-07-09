{
  inputs,
  outputs,
  lib,
  config,
  userConfig,
  pkgs,
  ...
}: {

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  # Nix settings
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  # Set keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Enable network manager
  networking = {
    networkmanager.enable = true;
  };

  # User configuration
  users.users.${userConfig.name} = {
    description = userConfig.name;
    extraGroups = ["networkmanager" "wheel" "docker"];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  # PATH configuration
  environment.localBinInPath = true;

  # Disable CUPS printing
  services.printing.enable = false;

  # Input settings
  services.libinput.enable = true;

  # Passwordless sudo
  security.sudo.wheelNeedsPassword = false;

  # Enable VMWare Guest Utilities
  virtualisation.vmware.guest.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    wget
    curl
    home-manager
    vscodium
    ghostty
    git
  ];

  # Docker configuration
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
    rootless.setSocketVariable = true;
  };

  # Basic apps enabled
  programs.zsh.enable = true;
  programs.firefox.enable = true;

  # Fonts configuration
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  # OpenSSH daemon
  services.openssh.enable = true;

  # Tailscale
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
