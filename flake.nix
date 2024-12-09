{
  description = "A basic flakelight templ to be used with nix-direnv";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";

  };

  outputs = { flakelight, nixpkgs, ... }:
    flakelight ./. {
      inputs.nixpkgs = nixpkgs;
      nixpkgs.config = { allowUnfree = true; };
      devShell = pkgs: {

        stdenv = pkgs.llvmPackages_19.stdenv;

        packages = with pkgs; [

          spdlog

          pre-commit
          commitizen

          llvmPackages_19.clang-tools

          lldb
          cmake
          cppcheck
          doxygen
          gtest
          lcov
          vcpkg
          vcpkg-tool
          gdb

          include-what-you-use
          ngrok

          python3

          zig
          gcc

        ];
      };
    };

}
