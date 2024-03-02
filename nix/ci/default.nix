{ pkgs, lib, stdenv, rust }:
let
    rustPlatform = pkgs.makeRustPlatform {
        cargo = rust;
        rustc = rust;
    };
in rustPlatform.buildRustPackage rec {
    name = "ci-runner";
    src = ../..;
    cargoLock.lockFile = ../../Cargo.lock;

    buildPhase = builtins.readFile ./ci-runner.sh;
    installPhase = ''
        mkdir $out
    '';
}
