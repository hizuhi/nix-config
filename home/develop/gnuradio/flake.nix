{
  description = "A Nix-flake-based Gnuradio development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self , nixpkgs ,... }: let
    # system should match the system you are running on
    system = "x86_64-linux";
    pythonVersion = "3.10";  # 指定Python版本
    pytorchVersion = "1.13.1";  # 指定PyTorch版本
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      # create an environment with nodejs-18_x, pnpm, and yarn
      packages = with pkgs; [
        (python3.withPackages (python-pkgs: with python-pkgs; [
        (pytorch.override { 
          python = python3; 
          version = pytorchVersion;
        })
        (numpy.override {
          python = python3; 
          version = "1.21.2";
        })
        ]))
        uhd
        volk
        gnuradio
      ];

      shellHook = ''
        echo "python `${pkgs.nodejs}/bin/python --version`"
      '';
    };
  };
}