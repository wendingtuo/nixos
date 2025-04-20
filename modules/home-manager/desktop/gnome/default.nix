{ pkgs, lib, ... }:
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
        ];
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "kitty.desktop"
          "firefox.desktop"
          "obsidian.desktop"
          "codium.desktop"
          ];
      };

      # Mutter customizations
      "org/gnome/mutter".edge-tiling = false;
      "org/gnome/mutter".dynamic-workspaces = true;

      # Desktop customizations
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";
      "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 (0); # disabled
      "org/gnome/desktop/screensaver".lock-enabled = false;
      "org/gnome/desktop/screensaver".lock-delay = lib.hm.gvariant.mkUint32 (0); # disabled
      "org/gnome/desktop/notifications".show-in-lock-screen = false;
      "org/gnome/desktop/sound".event-sounds = false; # disables bell sound in all applications
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat"; # disable mouse acceleration

      # Nautilus customizations
      "org/gtk/settings/file-chooser".show-hidden = true;
      "org/gtk/settings/file-chooser".list-view = true;

      # Tiling Shell customizations

      "org/gnome/sehll/extensions/tilingshell" = {
        inner-gaps = 4;
        outer-gaps = 4;
        enable-window-border = true;
        windows-border-width = 1;
      };

      # Dash to Dock customizations

      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 32;
        height-fraction = 60;
        dock-fixed = false;
        intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
        dock-position = "BOTTOM";
        show-trash = false;
        click-action = "focus-minimize-or-appspread";
        custom-theme-shrink = true;
        require-pressure-to-show = false;
      };
    };
  };
}