
{pkgs, config, lib, ...}:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.file.".emacs.d".source = ./.spacemacs;
}
