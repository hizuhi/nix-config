{config, ...}:
let
  nvimPath = "${config.home.homeDirectory}/nix-config/home/nvim/starter";
in
{
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}