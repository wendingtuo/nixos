{ pkgs, stateVersion, hostname, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
    ];
  
  networking.hostName = hostname;

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  system.stateVersion = stateVersion;
}
