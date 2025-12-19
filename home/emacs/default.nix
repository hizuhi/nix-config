
{pkgs, config, lib, ...}:
let
  emacsPath = "${config.home.homeDirectory}/nix-config/home/emacs/spacemacs";
in
{
  home.file.".emacs.d".source = config.lib.file.mkOutOfStoreSymlink emacsPath;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
}
