{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  # Catppuccin theming for GTK and Qt apps (Firefox, file pickers, etc.).
  gtk.enable = true;
  qt.enable = true;

  home.packages = with pkgs; [
    swww
    wl-clipboard
    grim
    slurp
    brightnessctl
    pavucontrol
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";

      monitor = [ ",preferred,auto,1" ];

      exec-once = [
        "waybar"
        "swww init"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        # Catppuccin Mocha: mauve / surface2
        "col.active_border" = "rgba(cba6f7ee)";
        "col.inactive_border" = "rgba(585b70aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        blur.enabled = true;
        shadow = {
          # Catppuccin Mocha: crust
          color = "rgba(11111bee)";
        };
      };

      misc = {
        # Catppuccin Mocha: base
        background_color = "rgb(1e1e2e)";
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating"
        "$mod, R, exec, $menu"
        "$mod, F, fullscreen"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };

  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 350;
      location = "center";
      show = "drun";
      prompt = "Search...";
      allow_markup = true;
    };
    style = ''
      window {
        margin: 0px;
        border: 2px solid #cba6f7;
        border-radius: 12px;
        background-color: #1e1e2e;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }

      #input {
        margin: 8px;
        border: none;
        border-radius: 8px;
        color: #cdd6f4;
        background-color: #313244;
      }

      #inner-box, #outer-box, #scroll {
        margin: 4px;
        border: none;
        background-color: #1e1e2e;
      }

      #text {
        margin: 4px;
        color: #cdd6f4;
      }

      #entry:selected {
        background-color: #cba6f7;
        border-radius: 8px;
      }

      #entry:selected #text {
        color: #1e1e2e;
      }
    '';
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "cpu" "memory" "battery" "tray" ];
      };
    };
  };
}
