{pkgs, config, ...}:

{
  primary-user.home-manager = {
    home.packages = [
      # internet
      pkgs.vivaldi
      pkgs.brave
      pkgs.firefox

      # media
      pkgs.vlc

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
      pkgs.comma
      pkgs.nix-index

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

      # nodejs for coc.nvim
      pkgs.nodejs

      # gcc
      pkgs.gcc
      pkgs.gnumake

      # android
      pkgs.android-studio
      pkgs.openjdk

      # random packages to try out
      pkgs.abella

      # neuron
      (let neuronRev = "d52ce56e68be5716b18d0183204a72a228e6786b";
           neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/${neuronRev}.tar.gz";
        in import neuronSrc)
    ];
  };
}
