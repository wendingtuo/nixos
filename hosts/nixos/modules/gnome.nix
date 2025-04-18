{
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
  # Gnome customisations
  services.gnome = {
    gnome-browser-connector.enable = true;
  };
}