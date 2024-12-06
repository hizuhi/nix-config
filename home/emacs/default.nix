{pkgs, config, lib, ...}:let
spacemacsSource = pkgs.fetchFromGitHub {
  owner = "syl20bnr";
  repo = "spacemacs";
  rev = "61c3fbd5367fb52f58826dddb83453af99503d5f";
  sha256 = "sha256-kmXyD50ysCANpnSAQS4ZkuKxC6k5ZZV64SSMa/6ltm0=";
};

in{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.file.".emacs.d" = {
    recursive = true;
    source = pkgs.runCommand "make-spacemacs-writable" {} ''
      mkdir -p $out
      cp -r ${spacemacsSource}/* $out
      chmod -R u+w $out
    '';
  };
}
