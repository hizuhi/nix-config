{config, pkgs, enableDesktopApps, ...}:
let
  baseList = [
    ../../home/core.nix
    ../../home/develop
    ../../home/programs
    ../../home/shell
    ../../home/emacs
    ../../home/nvim
    ../../home/vscode
    ../../home/ai
  ];
  
  desktopList = [
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
  

  programs.git.settings.user = {
    name = "hizuhi";
    email = "sunzhiye8@gmail.com";
  };
}
