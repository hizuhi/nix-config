{config, enableDesktopApps, ...}:

{
  imports = [
    ./common.nix
    ./git.nix
    ./xdg.nix
    ./nvim.nix
  ]
  ++[
    ./media.nix
    ./browsers.nix
  ];
}
