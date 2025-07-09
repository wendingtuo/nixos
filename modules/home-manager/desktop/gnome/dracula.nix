{ pkgs, config, userConfig, ...}: 
{
  home.packages = with pkgs; [
    dracula-theme
    dracula-icon-theme
  ];
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme".name = "Dracula";
    "org/gnome/desktop/interface" = {
      gtk-theme = "Dracula";
      icon-theme = "Dracula";
      cursor-theme = "Dracula-cursors";
    };
  };
  gtk.theme = {
    package = pkgs.dracula-theme;
    name = "Dracula";
  };
}