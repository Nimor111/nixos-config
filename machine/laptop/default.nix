{pkgs, config, ...}:

let
  nixosVersion = "19.09";
  home-manager = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-${nixosVersion}.tar.gz";
in
{
  imports =
    [
      "${home-manager}/nixos"
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
