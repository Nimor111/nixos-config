{ sources ? import ./sources.nix }:

let
  pkgs = import sources.nixpkgs {};

  niv = pkgs.symlinkJoin {
    name = "niv";
    paths = [ sources.niv ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/niv \
        --add-flags "--sources-file ${toString ./sources.json}"
    '';
  };

  build-nix-path-env-var = path:
    builtins.concatStringsSep ":" (
      pkgs.lib.mapAttrsToList (k: v: "${k}=${v}") path
    );

  nix-path = build-nix-path-env-var {
    nixpkgs = sources.nixpkgs;
    nixpkgs-overlays = "/etc/nixos/overlays";
    nixos-config = "/etc/nixos/configuration.nix";
  };

  set-nix-path = ''
    export NIX_PATH="${nix-path}"
  '';

  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e
    ${set-nix-path}
    sudo nixos-rebuild switch --show-trace
  '';
in

pkgs.mkShell {
  buildInputs = [
    niv
    rebuild
  ];
}
