{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        rust = pkgs.rust-bin.stable."1.76.0".default.override {
          extensions = [ "rust-src" ];
        };
      in
      {
        packages = {
          default = pkgs.callPackage ./default.nix { inherit rust; };
        };
        devShells = {
          default = pkgs.callPackage ./shell.nix { inherit rust; };
        };
        checks = {
          default = pkgs.callPackage ./nix/ci/. { inherit rust; };
        };
      });
}
