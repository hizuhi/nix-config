{
  pkgs,
  config,
  ...
}: 

{
  imports = [
    ./waybar.nix
    ./fix-cursor.nix
  ];
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  xresources.properties = {
    "Xcursor.size" = 18;
    "Xft.dpi" = 192;
  };
}
