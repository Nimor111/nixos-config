{ lib, ... }:
let
  sources = import ../../sources.nix;
in
{
  imports =
    [
      "${sources.home-manager}/nixos"
      ../../modules/custom
      ./hardware.nix

      ../../modules/services

      ../../modules/nix-path
      ../../modules/user
      ../../modules/virtualisation
      ../../modules/fonts
      ../../modules/networking
      ../../modules/boot
      ../../modules/nixpkgs
      ../../modules/backlight
      ../../modules/tmux
      ../../modules/xinit
      ../../modules/dunst
      ../../modules/fzf
      ../../modules/git
      ../../modules/zathura
      ../../modules/neovim
      ../../modules/xmobar
      ../../modules/xpm
      ../../modules/xmonad
      ../../modules/termite
      ../../modules/termonad
      ../../modules/misc/packages
      ../../modules/zsh
      ../../modules/qutebrowser
      ../../cachix.nix
    ];

  # Define hostname
  networking.hostName = "nixos-gb";

  # sound
  sound.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

  # Extra options
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  primary-user.name = "gbojinov";
  primary-user.email = "georgi.bojinov@hotmail.com";
  primary-user.userName = "Nimor111";
  primary-user.hashedPassword = lib.fileContents ../../gbojinov.hashedPassword;
}
