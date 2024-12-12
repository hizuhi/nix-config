{config, pkgs, enableDesktopApps, ...}:
{
  _module.args = {inherit enableDesktopApps;};
  
  imports = [
    ../../home/core.nix
    ../../home/develop/gnuradio
    ../../home/programs
    ../../home/shell
    ../../home/emacs
  ]
  ++[
    ../../home/vscode
    ../../home/hyprland
    ../../home/rofi
    ../../home/fcitx5
  ]; 

  programs.git = {
    userName = "hizuhi";
    userEmail = "sunzhiye8@gmail.com";
  };
}
