{ inputs, hostname, nixosModules, ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    "${nixosModules}/common"
    "${nixosModules}/common/firefox.nix"
    "${nixosModules}/desktop/gnome"
    "${nixosModules}/desktop/kde"
    # "${nixosModules}/services/tailscale.nix"
    # "${nixosModules}/services/wireguard.nix"
  ];

  networking.hostName = hostname;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";

}
