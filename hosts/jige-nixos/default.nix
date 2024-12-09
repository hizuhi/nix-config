# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/hyprland.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./suspend-and-hibernate.nix
    ];

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
        menuentry "Windows" {
          search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
          chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  # fileSystems."/mnt/windows/d" = {
  #   device = "/dev/nvme0n1p5";
  #   fsType = "ntfs";
  # };

  # fileSystems."/mnt/windows/c" = {
  #   device = "/dev/nvme0n1p3";
  #   fsType = "ntfs";
  # };
  services.v2raya.enable = true; 
  programs.ssh.extraConfig = ''
    Host github.com
      port 443
      User git
      HostName ssh.github.com
  '';
  networking.hostName = "jige-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://127.0.0.1:20171/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}


