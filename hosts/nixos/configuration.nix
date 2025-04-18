{ config, pkgs, stateVersion, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
    ];
  
  # Networking
  networking.hostName = hostname;

  # Use packages.nix to declare packages
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  system.stateVersion = stateVersion; # Don't touch this!
}
