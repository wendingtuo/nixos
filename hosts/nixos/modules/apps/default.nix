{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./obsidian.nix
  ];
}