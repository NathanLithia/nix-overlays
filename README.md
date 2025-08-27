To add overlay use:
```
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/NathanLithia/nix-overlays/archive/refs/heads/main.tar.gz";
    }))
  ];
```
To install packages do:
```
  environment.systemPackages = with pkgs; [
    nathanlithia.vdl
    nathanlithia.gdl
    nathanlithia.mdl
    nathanlithia.mvdl
    nathanlithia.gallery-dl
  ];
```
To get a hash of a repo use:
```
nix-prefetch-github mikf gallery-dl --rev v1.30.5
```
