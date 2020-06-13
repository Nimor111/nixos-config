{ pkgs, ... }:

{
  primary-user.home-manager = {
    home.packages = [
      # internet
      pkgs.firefox

      # media
      pkgs.vlc

      # security
      pkgs.gnupg
      pkgs.pass

      # terminal apps and tools
      pkgs.termonad-with-packages
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
      pkgs.choose

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

      # notes
      pkgs.joplin
      pkgs.joplin-desktop

      # neuron
      (
        let
          neuronRev = "ac46252e0d68a1d7176c223515b04a56f9e5cfa9";
          neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/${neuronRev}.tar.gz";
        in
          import neuronSrc
      )
    ];
  };
}
