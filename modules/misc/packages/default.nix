{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    home.packages = [

      # internet
      pkgs.vivaldi

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

      # the one and only
      pkgs.home-manager

      # i3 extras
      pkgs.i3lock-fancy

      # text editors
      pkgs.emacs

      # python packages
      pkgs.python3Full
      pkgs.python37Packages.virtualenv
      pkgs.python37Packages.virtualenvwrapper

      # gcc
      pkgs.gcc
      pkgs.gnumake

      # nodejs
      pkgs.nodejs
    ];
  };
}
