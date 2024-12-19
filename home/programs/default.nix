{config, enableDesktopApps, ...}:
let
  baseList = [
    ./common.nix
    ./git.nix
    ./xdg.nix
  ];
  
  desktopList = [
    ./media.nix
    ./browsers.nix
  ];
in
{
  imports = if enableDesktopApps then
    baseList ++ desktopList
  else
    baseList;
}
