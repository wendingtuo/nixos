{ inputs, hostname, nixosModules, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    "${nixosModules}/common"
    "${nixosModules}/common/firefox.nix"
    "${nixosModules}/desktop/gnome"
    "${nixosModules}/services/tailscale.nix"
    "${nixosModules}/services/wireguard.nix"
  ];

  networking.hostName = hostname;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";

}