{lib, ...}: 
{
  ##################################################################################################################
  #
  # NixOS Configuration
  #
  ##################################################################################################################

  users.users.szy = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP0v9LA1QNsKGSbwglaWW+A/2ebfiNFFASDK+f3yqOP/ szy@nixos"
    ];
    uid = lib.mkForce 1001;
  };
}
