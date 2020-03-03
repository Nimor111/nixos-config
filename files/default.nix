{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    home.file = {
      ".xinitrc".text = ''
        # Set toggle between langs
        # setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,bg -variant ,phonetic &

        # Set wallpaper
        exec feh --bg-scale ./wallpaper.png &

        # Start wm
        exec i3 -l
      '';
    };
  };
}
