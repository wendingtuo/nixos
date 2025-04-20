{ pkgs, lib, nhModules, ... }:
with lib.hm.gvariant; {
  imports = [
    "${nhModules}/desktop/gnome/dracula.nix"
  ];

  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.system-monitor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-shell
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.space-bar
  ];

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
          "just-perfection-desktop@just-perfection"
          "space-bar@luchrioh"
        ];
        disabled-extensions = [];
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
      "org/gnome/mutter".center-new-windows = true;

      # Desktop customizations
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/interface".monospace-font-name = "JetBrainsMono Nerd Font 12";
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
        quarter-tiling-threshold = lib.hm.gvariant.mkUint32 (10);
      };

      # Dash to Dock customizations
      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 32;
        height-fraction = 60;
        dock-fixed = false;
        intellihide-mode = "ALL_WINDOWS";
        dock-position = "BOTTOM";
        show-trash = false;
        click-action = "focus-minimize-or-appspread";
        custom-theme-shrink = true;
        require-pressure-to-show = false;
        hot-keys = false;
      };
      
      # Keybindings
      "org/gnome/desktop/wm/keybindings" = {
        "close" = ["<Super>q"];
        "minimize" = ["<Super>comma"];
        "move-to-center" = ["<Control><Alt>c"];
        "move-to-workspace-1" = ["<Super><Shift>1"];
        "move-to-workspace-10" = ["<Super><Shift>0"];
        "move-to-workspace-2" = ["<Super><Shift>2"];
        "move-to-workspace-3" = ["<Super><Shift>3"];
        "move-to-workspace-4" = ["<Super><Shift>4"];
        "move-to-workspace-5" = ["<Super><Shift>5"];
        "move-to-workspace-6" = ["<Super><Shift>6"];
        "move-to-workspace-7" = ["<Super><Shift>7"];
        "move-to-workspace-8" = ["<Super><Shift>8"];
        "move-to-workspace-9" = ["<Super><Shift>9"];
        "switch-to-workspace-1" = ["<Super>1"];
        "switch-to-workspace-2" = ["<Super>2"];
        "switch-to-workspace-3" = ["<Super>3"];
        "switch-to-workspace-4" = ["<Super>4"];
        "switch-to-workspace-5" = ["<Super>5"];
        "switch-to-workspace-6" = ["<Super>6"];
        "switch-to-workspace-7" = ["<Super>7"];
        "switch-to-workspace-8" = ["<Super>8"];
        "switch-to-workspace-9" = ["<Super>9"];
        "toggle-fullscreen" = ["<Super>m"];
      };
    
      # Space Bar customizations
      "org/gnome/shell/extensions/space-bar/appearance" = {
        "inactive-workspace-text-color" = "rgb(189, 147, 249)";
        "workspace-margin" = 3;
        "workspaces-bar-padding" = 3;
      };
      "org/gnome/shell/extensions/space-bar/behavior" = {
        "scroll-wheel" = "panel";
        "show-empty-workspaces" = false;
        "smart-workspace-names" = false;
        "toggle-overview" = true;
      };
      "org/gnome/shell/extensions/space-bar/shortcuts" = {
        "enable-activate-workspace-shortcuts" = true;
        "enable-move-to-workspace-shortcuts" = true;
      };

      # Just Perfection customizations
      "org/gnome/dekstop/extensions/just-perfection" = {
        startup-status = 0;
        theme = true;
      };
    };
  };
}