Nix edu
=======

## Environment setup

1. Install nix by following instructions at https://nixos.org/download
2. Add the following line to `/etc/nix/nix.conf`:
```nix
experimental-features = nix-command flakes
```
3. Install [direnv](https://direnv.net) and [direnv VSCode extension](https://marketplace.visualstudio.com/items?itemName=mkhl.direnv).

## Workflow

* Run the main binary
```sh
nix run
```

* Enter development shell
```sh
nix develop
```

* Run CI checks
```sh
nix flake check
```
