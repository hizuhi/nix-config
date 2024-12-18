
{pkgs, config, lib, ...}:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
  };

  # home.file = {
  #   ".spacemacs" = {
  #     source = config.lib.file.mkOutOfStoreSymlink "/home/szy/";
  #   };
  # };

  home.file.".emacs.d" = {
    source = ./spacemacs;
    recursive = true;
  };
}
