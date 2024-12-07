{pkgs, ...}: {
  ##################################################################################################################
  #
  # All Ryan's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix

    ../../home/fcitx5
    ../../home/hyprland
    ../../home/programs
    ../../home/rofi
    ../../home/shell
    ../../home/vscode
    ../../home/emacs

  ];

  programs.git = {
    userName = "hizuhi";
    userEmail = "sunzhiye8@gmail.com";
  };
}
