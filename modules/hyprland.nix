{inputs, pkgs, ...}:

{
    programs.hyprland = {
        enable = true;
    };
    
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

    environment.systemPackages = with pkgs; [
	rofi-wayland
    dunst
    wl-clipboard
    cliphist
    slurp
    polkit
	acpi
	gtk3
	brightnessctl
	perl538Packages.OpenGL
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    ];
} 
