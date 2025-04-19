{
  services.xserver = {
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