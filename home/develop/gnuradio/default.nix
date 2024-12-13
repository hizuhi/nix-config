{pkgs, config, ...}:
let
myGnuradio = pkgs.gnuradio.override {
  extraPythonPackages = with pkgs; [
    python311Packages.pytorch
    python311Packages.torchvision
    python311Packages.torchaudio
    python311Packages.numpy
    python311Packages.scipy
    python311Packages.timm
    python311Packages.einops
  ];
  extraPackages = with pkgs; [
    clang-tools
  ];
};
in
{
  home.packages = [
    myGnuradio
  ];
  home.file.".local/share/applications/gnuradio.desktop".source = ./gnuradio.desktop;
}
