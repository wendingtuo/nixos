{ inputs, hostname, nixosModules, ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    "${nixosModules}/common"
    "${nixosModules}/common/firefox.nix"
    "${nixosModules}/desktop/gnome"
    "${nixosModules}/services/tailscale.nix"
    # "${nixosModules}/services/wireguard.nix"
    # "${nixosModules}/services/sops.nix"
  ];

  networking.hostName = hostname;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  stdenv.hostPlatform.system.stateVersion = "25.05";

}
