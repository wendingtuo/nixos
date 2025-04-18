{
  # Nix settings
  nix = {
    settings.experimental-features = 
    [
      "nix-command" 
      "flakes"
    ];
    package = pkgs.nixVersions.stable;
  };
}