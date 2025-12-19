{pkgs, config, ...}:
let
myPython = (pkgs.python311.withPackages (python311Packages: with python311Packages; [
        torch
        torchvision
        torchaudio
        numpy
        scipy
        timm
        einops
        mako
        sphinx
        lxml
        pyqt5
        yamlfix
        yamllint
        yamlloader
        click
        click-plugins
        pyzmq
        pygccxml
        pygobject3
        pybind11
        matplotlib
        pyqtgraph
        soapysdr
        setuptools
        packaging
        jsonschema
        qtpy
        pyudev
    ]));
in
{
  home.packages = [
    myPython
  ] ++ (with pkgs; [
    libsndfile
    libiio
    libad9361
    spdlog
    boost
    gmp
    doxygen
  ]);
}

