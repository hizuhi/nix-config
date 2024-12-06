{config, pkgs, ...}:

{
    imports =
        [
            ../../modules/system.nix
            ../../modules/hyprland.nix
        ];

    wsl.enable = true;
    wsl.defaultUser = "szy";
    system.stateVersion = "24.05"; # Did you read the comment?
    networking.hostName = "wsl";
}