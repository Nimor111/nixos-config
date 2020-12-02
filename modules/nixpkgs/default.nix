{ ... }:
let
  sources = import ../../sources.nix;
in
{
  nix.nixPath = [ "nixpkgs=${sources.nixpkgs}" ];
  nixpkgs = {
    config = import ./nixpkgs-config.nix;
  };

  primary-user.home-manager = {
    # puts it in .config/nixpkgs/config.nix
    xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs-config.nix;
  };

  home-manager.useGlobalPkgs = true;
}
