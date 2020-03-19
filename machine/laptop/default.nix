{...}:

let
  sources = import ../../sources.nix;
in
{
  imports =
    [
      "${sources.home-manager}/nixos"
      ./hardware.nix

      ../../modules/nix-path
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
