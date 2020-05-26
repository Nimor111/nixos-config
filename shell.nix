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
  overlays = "$dotfiles/overlays";

  darwinRebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e

    export dotfiles="$(nix-build --no-out-link)"

    ${lint}/bin/lint
    ${format}/bin/format

    darwin-rebuild switch --show-trace \
      -I darwin=${sources.nix-darwin} \
      -I nixpkgs=${sources.nixpkgs} \
      -I darwin-config=${configuration} \
  '';

  nixosRebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -e

    export dotfiles="$(nix-build --no-out-link)"

    ${lint}/bin/lint
    ${format}/bin/format

    sudo nixos-rebuild switch --show-trace \
      -I nixpkgs=${sources.nixpkgs} \
      -I nixos-config=${configuration} \
      -I nixpkgs-overlays=${overlays}
  '';

  rebuild = if isDarwin then darwinRebuild else nixosRebuild;

  files = "$(find . -name '*.nix')";

  format = pkgs.writeShellScriptBin "format" "nixpkgs-fmt ${files}";

  lint = pkgs.writeShellScriptBin "lint" "nix-linter ${files} && echo No lint errors!";
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
