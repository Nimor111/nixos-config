{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    home.packages = [
      pkgs.neofetch
      pkgs.sakura
      pkgs.vivaldi
      pkgs.home-manager
      pkgs.i3lock-fancy
      pkgs.acpi
      pkgs.rtv
      pkgs.emacs
      pkgs.fd
      pkgs.ripgrep
      pkgs.bat
      pkgs.htop
    ];
  };
}
