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

      ../../modules/virtualisation
      ../../modules/services
      ../../modules/networking
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

  boot = {
    # Use the GRUB 2 boot loader.
    loader.grub.enable = true;
    loader.grub.version = 2;
    # Define on which hard drive you want to install Grub.
    loader.grub.device = "/dev/sda";
    # Add Arch Linux on /dev/sda1 to grub entries
    loader.grub.extraEntries = ''
      menuentry 'Arch Linux' {
        configfile (hd0,1)/boot/grub/grub.cfg
      }
    '';
    # always used latest available kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Define hostname
  networking.hostName = "nixos-gb";

  # sound
  sound.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    wget
    vim
    acpi
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gbojinov = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "audio"
      "docker" # Don't use sudo for docker
    ];
  };

  # set to 19.03 because of https://github.com/NixOS/nixpkgs/issues/64922
  system.stateVersion = "19.03"; # Did you read the comment?

  # install proprietary packages
  nixpkgs.config.allowUnfree = true;

  # fonts
  fonts.fonts = with pkgs; [font-awesome_5];
}
