{config, pkgs, enableDesktopApps, ...}:
let
  baseList = [
    ../../home/core.nix
    ../../home/develop/gnuradio
    ../../home/programs
    ../../home/shell
    ../../home/emacs
    ../../home/nvim
  ];
  
  desktopList = [
    ../../home/vscode
    ../../home/hyprland
    ../../home/rofi
    ../../home/fcitx5
  ];
in
{
  _module.args = {inherit enableDesktopApps;};

  imports = if enableDesktopApps then
  baseList ++ desktopList
  else baseList; 
  

  programs.git = {
    userName = "hizuhi";
    userEmail = "sunzhiye8@gmail.com";
  };
}
