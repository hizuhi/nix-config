{pkgs, config, ...}:
let
myPython = (pkgs.python3.withPackages (python311Packages: with python311Packages; [
        pytorch
        torchvision
        torchaudio
        numpy
        scipy
        timm
        einops
    ]))
in
{
  home.packages = [
    myPython
  ];
}
