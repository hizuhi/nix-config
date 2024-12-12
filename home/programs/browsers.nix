{
  pkgs,
  config,
  username,
  ...
}:
{
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation"
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
      ];
      extensions = [
        # {id = "";}  // extension id, query from chrome web store
      ];
    };

    firefox = {
      enable = true;
      profiles.${username} = {};
    };

    vivaldi = {
      enable = true;
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
      ];    
    };
  };
}
