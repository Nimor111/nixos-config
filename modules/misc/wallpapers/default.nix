{pkgs, config, ...}:

{
  primary-user.home-manager = {
    services.random-background = {
      enable = true;
      imageDirectory = "%h/wallpapers";
      interval = "10s";
    };
  };
}
