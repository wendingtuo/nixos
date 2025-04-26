{ ... }:
{
  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;

    # Enable pulse audio, disable pipewire
    pulseaudio.enable = true;
    pipewire.enable = false;
  };
  security.rtkit.enable = true;

  # Remove default KDE packages
  environment.plasma6.excludePackages = [
  ];
}