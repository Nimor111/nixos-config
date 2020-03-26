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

  configuration = /etc/nixos/configuration.nix;
  overlays = /etc/nixos/overlays;

  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e
    sudo nixos-rebuild switch --show-trace \
      -I nixpkgs=${sources.nixpkgs} \
      -I nixos-config=${configuration} \
      -I nixpkgs-overlays=${overlays}
  '';
in

pkgs.mkShell {
  buildInputs = [
    niv
    rebuild
  ];
}
