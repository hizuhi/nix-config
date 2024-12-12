{config, enableDesktopApps, ...}:

{
  imports = [
    ./common.nix
    ./git.nix
    ./xdg.nix
  ]
  ++[
    ./media.nix
    ./browsers.nix
  ];
}
