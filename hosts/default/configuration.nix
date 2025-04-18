{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  
  # Networking
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
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

  # Enable X11 & GNOME
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable VMWare Guest Utilities
  virtualisation.vmware.guest.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Nix settings
  nix = {
    settings.experimental-features = 
    [
      "nix-command" 
      "flakes"
    ];
    package = pkgs.nixVersions.stable;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.blake = {
    isNormalUser = true;
    description = "blake";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Use packages.nix to declare packages
  environment.systemPackages = with pkgs; import ./packages.nix { inherit pkgs; };

  # Gnome customisations
  services.gnome = {
    gnome-browser-connector.enable = true;
  };

  system.stateVersion = "24.11"; # Don't touch this!
}
