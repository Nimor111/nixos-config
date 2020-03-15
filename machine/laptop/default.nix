{pkgs, config, ...}:

let
  sources = import ../../sources.nix;
  nixosVersion = "19.09";
in
{
  imports =
    [
      "${sources.home-manager}/nixos"
      ./hardware.nix

      ../../modules/user
      ../../modules/virtualisation
      ../../modules/services
      ../../modules/fonts
      ../../modules/networking
      ../../modules/boot
      ../../modules/nixpkgs
      ../../modules/backlight
      ../../modules/tmux
      ../../modules/xinit
      ../../modules/git
      ../../modules/zathura
      ../../modules/neovim
      ../../modules/xmobar
      ../../modules/xpm
      ../../modules/xmonad
      ../../modules/termite
      ../../modules/misc/packages
      ../../modules/zsh
    ];

  # Define hostname
  networking.hostName = "nixos-gb";

  # sound
  sound.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Sofia";
}
