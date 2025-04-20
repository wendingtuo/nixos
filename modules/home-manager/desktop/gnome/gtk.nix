{ pkgs, userConfig, ...}: 
{
  gtk = {
    enable = true;
    theme = { 
      dracula = {
        name = "Dracula";
        package = pkgs.dracula-theme;
      };
      catppuccin = {
        name = "Catppuccin";
        package = pkgs.catppuccin-gtk;
      };
    };
    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = {
        dracula = "Dracula";
      };
    };
  }
  catppuccin = {
    gtk = {
      enable = true;
      gnomeShellTheme = true;
    };
  };
}