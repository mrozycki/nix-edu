{ stdenv, pkgs, rust }:
let
  manifest = (pkgs.lib.importTOML ./Cargo.toml).package;
in stdenv.mkDerivation rec {
  pname = manifest.name;
  version = manifest.version;

  src = ./.;

  buildInputs = [ 
    rust
  ];
  buildPhase = ''
    cargo build --release
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp target/release/${pname} $out/bin
  '';
}