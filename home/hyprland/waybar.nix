# https://github.com/Alexays/Waybar/wiki/Configuration
{config, lib, ...}:

{
  home.file.".config/waybar/waybar-css".source = ./waybar-css;
  programs.waybar = {
    enable = true;
    style = lib.mkBefore ''
      @import "./waybar-css/style.css";
    '';
    settings = {
      mainBar = {
        # output = [ "eDP-1" ]; # Laptop screen only
        height = 15;
        modules-center = [
          # "hyprland/window"
          "clock"
        ];
        modules-right = [
          "hyprland/workspaces"
          "cpu"
          "memory"
          "backlight"
          "battery"
          "power-profiles-daemon"
          "pulseaudio"
          "network"
          "bluetooth"
          "tray"
        ];
        "hyprland/workspaces" = {
          # active-only = true;
          # all-outputs = true;
          show-special = true;
          /*
          format = "{name}{icon}";
          format-icons = {
            active = "";
            default = "";
          };
          */
        };
        "cpu" = {
          format = "{}% ";
        };
        "memory" = {
          format = "{}% {icon}";
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };
        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            "power-saver" = "";
          };
        };
        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            phone = "";
            portable = "";
            car = "";
            default = ["󰖀" "󰕾" ""]; # Assuming consistent icons for simplicity
          };
          on-click = "pavucontrol";
        };
        "clock" = {
          format = "{:%H:%M}  ";
          format-alt = "{:%A, %B %d, %Y (%R)}  ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'>{}</span>";
              weeks = "<span color='#99ffdd'>{}</span>";
              weekdays = "<span color='#ffcc66'>{}</span>";
              today = "<span color='#ffee99'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
        "bluetooth" = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "blueman-manager";
        };
      };
    };
  };
}