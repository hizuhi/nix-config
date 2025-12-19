{config, pkgs, ...}:

{
  services = {
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
      excludePackages = with pkgs; [xterm];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
