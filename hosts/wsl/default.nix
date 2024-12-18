{config, pkgs, ...}:

{
    imports =
        [
            ../../modules/system.nix
        ];

    wsl.enable = true;
    wsl.defaultUser = "szy";
    system.stateVersion = "24.11"; # Did you read the comment?
    networking.hostName = "wsl";
}
