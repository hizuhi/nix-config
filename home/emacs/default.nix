{pkgs, config, lib, ...}:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.file.".emacs.d" = {
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "syl20bnr";
      repo = "spacemacs";
      rev = "develop";
      sha256 = "sha256-kmXyD50ysCANpnSAQS4ZkuKxC6k5ZZV64SSMa/6ltm0=";
    };
  };
}
