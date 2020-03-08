{ config, pkgs, ... }:

let
  nixosVersion = "19.09";
  home-manager = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-${nixosVersion}.tar.gz";
  home = "/home/gbojinov";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cachix.nix
      "${home}/nix-config/tmux"
      "${home}/nix-config/xinit"
      "${home}/nix-config/git"
      "${home}/nix-config/zathura"
      "${home}/nix-config/neovim"
      #"${home}/nix-config/i3",
      "${home}/nix-config/xmobar"
      "${home}/nix-config/xpm"
      "${home}/nix-config/xmonad"
      "${home}/nix-config/termite"
      # "${home}/nix-config/misc/wallpapers"
      "${home}/nix-config/misc/packages"
      "${home}/nix-config/zsh"
      "${home-manager}/nixos"
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # wifi
  networking.networkmanager.enable = true;

  # Add Arch Linux on /dev/sda1 to grub entries
  boot.loader.grub.extraEntries = ''
      menuentry 'Arch Linux' {
        configfile (hd0,1)/boot/grub/grub.cfg
        }
  '';

  networking.hostName = "nixos-gb"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget vim
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  #hardware.pulseaudio = {
    #enable = true;
    #package = pkgs.pulseaudioFull;
    #support32Bit = true;
  #};

  # Enable the X11 windowing system.
  services.xserver = {
    exportConfiguration = true; # link /usr/share/X11/ properly
    enable = true;
    layout = "us,bg";
    xkbOptions = "grp:switch,grp:alt_shift_toggle,grp_led:scroll";
    xkbVariant = ",phonetic";
    displayManager.startx.enable = true;
  };

  # Fonts
  fonts.fonts = with pkgs; [font-awesome_5];

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # docker
  virtualisation = {
    docker = {
      enable = true;
    };
  };

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

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.

  # set to 19.03 because of https://github.com/NixOS/nixpkgs/issues/64922
  system.stateVersion = "19.03"; # Did you read the comment?

  # allow installing non-free packages
  nixpkgs.config.allowUnfree = true;

  # allow installing nix packages marked as broken
  # nixpkgs.config.allowBroken = true;

  # light settings
  programs.light.enable = true;
}
