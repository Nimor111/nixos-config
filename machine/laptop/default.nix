{pkgs, config, ...}:

let
  nixosVersion = "19.09";
  home-manager = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-${nixosVersion}.tar.gz";
  home = "/home/gbojinov";
in
{
  imports =
    [
      "${home-manager}/nixos"
      "${home}/nix-config/services"
      "${home}/nix-config/machine/laptop/hardware.nix"

      "${home}/nix-config/modules/tmux"
      "${home}/nix-config/modules/xinit"
      "${home}/nix-config/modules/git"
      "${home}/nix-config/modules/zathura"
      "${home}/nix-config/modules/neovim"
      "${home}/nix-config/modules/xmobar"
      "${home}/nix-config/modules/xpm"
      "${home}/nix-config/modules/xmonad"
      "${home}/nix-config/modules/termite"
      "${home}/nix-config/modules/misc/packages"
      "${home}/nix-config/modules/zsh"
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
  };

  # Define hostname and wifi with network manager
  networking = {
    hostName = "nixos-gb";
    networkmanager.enable = true;
  };

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

  # light settings
  programs.light.enable = true;

  # install proprietary packages
  nixpkgs.config.allowUnfree = true;

  # docker
  virtualisation.docker.enable = true;

  # fonts
  fonts.fonts = with pkgs; [font-awesome_5];
}
