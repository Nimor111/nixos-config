{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    home.packages = [

      # internet
      pkgs.vivaldi

      # terminal apps and tools
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

      # elixir
      pkgs.elixir

      # scala
      pkgs.scala
      pkgs.sbt
      pkgs.jetbrains.idea-community

      # gcc
      pkgs.gcc
    ];
  };
}
