{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    home.file = {
      ".config/xmobar/xpm" = {
        source = ./xpm;
        recursive = true;
      };
    };
  };
}
