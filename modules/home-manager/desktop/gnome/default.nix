{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          "dash-to-dock@micxgx.gmail.com"
          "blur-my-shell@aunetx"
          "tilingshell@ferrarodomenico.com"
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
        disabled-extensions = [
          # "window-list@gnome-shell-extensions.gcampax.github.com"
          # "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
          # "light-style@gnome-shell-extensions.gcampax.github.com"
          # "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
          # "apps-menu@gnome-shell-extensions.gcampax.github.com"
          # "emoji-copy@felipeftn"
          # "native-window-placement@gnome-shell-extensions.gcampax.github.com"
          # "status-icons@gnome-shell-extensions.gcampax.github.com"
        ];
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "kitty.desktop"
          "firefox.desktop"
          "obsidian.desktop"
          "codium.desktop"
          ];
      };
      "org/gnome/mutter".edge-tiling = false;
      "org/gnome/mutter".dynamic-workspaces = true;

      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";
      "org/gnome/desktop/session".idle-delay = 0; # disabled
      "org/gnome/desktop/screensaver".lock-enabled = false;
      "org/gnome/desktop/screensaver".lock-delay = 0; # disabled
      "org/gnome/desktop/notifications".show-in-lock-screen = false;
      "org/gnome/desktop/sound".event-sounds = false; # disables bell sound in all applications
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat"; # disable mouse acceleration

      "org/gtk/settings/file-chooser".show-hidden = true;
      "org/gtk/settings/file-chooser".list-view = true;
    };
  };
}