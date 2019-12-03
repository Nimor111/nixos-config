{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    services.random-background = {
      enable = true;
      imageDirectory = "%h/wallpapers";
      interval = "10s";
    };
  };
}
