{ pkgs, config, ... }:

let
  load-overlay = overlay:
    import "${toString <nixpkgs-overlays>}/${overlay}";

  all-overlays =
    builtins.attrNames (builtins.readDir (toString <nixpkgs-overlays>));
in
{
  nixpkgs = {
    config = import ./nixpkgs-config.nix;
    overlays = map load-overlay all-overlays;
  };

  primary-user.home-manager = {
    nixpkgs.config = config.nixpkgs.config;

    # puts it in .config/nixpkgs/config.nix
    xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs-config.nix;
  };
}
