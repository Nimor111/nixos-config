{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    services.random-background = {
      enable = true;
      imageDirectory = "%h/wallpapers";
      interval = "10s";
    };
  };
}
