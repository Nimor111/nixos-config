{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    home.file = {
      ".xinitrc".text = ''
        # Set wallpaper
        # exec feh --bg-scale ./wallpaper.png &

        # Start wm
        exec xmonad
      '';
    };
  };
}
