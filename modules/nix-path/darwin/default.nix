{ lib, ... }:

{
  nix.nixPath = lib.mapAttrsToList (k: v: "${k}=${v}") {
    nixpkgs = toString <nixpkgs>;
    darwin = toString <darwin>;
    nixpkgs-overlays = toString <nixpkgs-overlays>;
    darwin-config = toString <darwin-config>;
  };
}
