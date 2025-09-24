{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { nixpkgs, ... }: let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
        devShells.x86_64-linux.default = pkgs.mkShell {
            buildInputs = with pkgs; [
                # Build tools
                clang
                cmake
                gnumake
                pkg-config

                # Libraries
                libcxx
                libcxx.dev

                # GLFW3 and its X11 dependencies
                glfw
                libGL
                mesa
                xorg.libX11
                xorg.libXrandr
                xorg.libXinerama
                xorg.libXcursor
                xorg.libXi
                xorg.libXxf86vm

                # GLM
                glm
            ];
        };
    };
}
