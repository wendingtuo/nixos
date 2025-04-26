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
  # xdg.configFile = {
  # "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  # "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  # "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
# };
}