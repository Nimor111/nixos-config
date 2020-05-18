{pkgs, config, ...}:

{
  primary-user.home-manager = {
    home.packages = [
      # internet
      pkgs.vivaldi
      pkgs.brave
      pkgs.firefox

      # security
      pkgs.gnupg
      pkgs.pass

      # terminal apps and tools
      pkgs.wget
      pkgs.vim
      pkgs.neofetch
      pkgs.acpi
      pkgs.rtv
      pkgs.fd
      pkgs.ripgrep
      pkgs.bat
      pkgs.htop
      pkgs.autojump
      pkgs.jq
      pkgs.exa
      pkgs.feh
      pkgs.xmobar
      pkgs.dmenu
      pkgs.xclip
      pkgs.pfetch
      pkgs.direnv
      pkgs.vifm
      pkgs.sxiv
      pkgs.nix-prefetch-git
      pkgs.cachix

      # notifications
      pkgs.libnotify

      # for a world with virtual machines
      pkgs.qemu

      # sometimes it's needed
      pkgs.libreoffice

      # for conversions
      pkgs.pandoc

      # the one and only
      pkgs.home-manager

      # i3 extras
      pkgs.i3lock-fancy

      # text editors
      pkgs.emacs

      # python packages
      # pkgs.python3Full
      # pkgs.python37Packages.virtualenv
      # pkgs.python37Packages.virtualenvwrapper

      # gcc
      pkgs.gcc
      pkgs.gnumake

      # nodejs
      pkgs.nodejs

      # android
      pkgs.android-studio
      pkgs.openjdk

      # random packages to try out
      pkgs.abella

      # neuron
      (let neuronSrc = builtins.fetchTarball https://github.com/srid/neuron/archive/master.tar.gz;
        in import neuronSrc)
    ];
  };
}
