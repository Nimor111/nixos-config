{ sources ? import ./sources.nix }:

let
  pkgs = import sources.nixpkgs {};

  isDarwin = pkgs.stdenvNoCC.isDarwin;

  niv = pkgs.symlinkJoin {
    name = "niv";
    paths = [ sources.niv ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/niv \
        --add-flags "--sources-file ${toString ./sources.json}"
    '';
  };

  configuration = if isDarwin then ~/.nixpkgs/darwin-configuration.nix else /etc/nixos/configuration.nix;
  overlays = if isDarwin then ~/.nixpkgs/overlays else /etc/nixos/overlays;

  darwinRebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e
    darwin-rebuild switch --show-trace \
      -I darwin=${sources.nix-darwin} \
      -I nixpkgs=${sources.nixpkgs} \
      -I darwin-config=${configuration} \
      -I nixpkgs-overlays=${overlays}
  '';

  nixosRebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e
    sudo nixos-rebuild switch --show-trace \
      -I nixpkgs=${sources.nixpkgs} \
      -I nixos-config=${configuration} \
      -I nixpkgs-overlays=${overlays}
  '';

  rebuild = if isDarwin then darwinRebuild else nixosRebuild;

  files = "$(find . -name '*.nix')";

  format = pkgs.writeShellScriptBin "format" "nixpkgs-fmt ${files}";

  lint = pkgs.writeShellScriptBin "lint" "nix-linter ${files}";
in

pkgs.mkShell {
  buildInputs = [
    pkgs.nixpkgs-fmt
    pkgs.nix-linter
    niv
    rebuild
    format
    lint
  ];
}
