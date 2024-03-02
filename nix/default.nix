{ stdenv, pkgs, rust }:
let
  manifest = (pkgs.lib.importTOML ../Cargo.toml).package;
  rustPlatform = pkgs.makeRustPlatform {
    rustc = rust;
    cargo = rust;
  };
in rustPlatform.buildRustPackage rec {
  pname = manifest.name;
  version = manifest.version;

  src = ./..;
  cargoLock.lockFile = ../Cargo.lock;

  buildInputs = [ 
  ];
  buildPhase = ''
    cargo build --release
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp target/release/${pname} $out/bin
  '';
}