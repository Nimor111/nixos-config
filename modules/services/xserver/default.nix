{ ... }:

{
  services = {
    xserver = {
      exportConfiguration = true; # link /usr/share/X11/ properly
      enable = true;
      layout = "us,bg";
      xkbOptions = "grp:switch,grp:alt_shift_toggle,grp_led:scroll";
      xkbVariant = ",phonetic";
      displayManager.startx.enable = true;
      libinput.enable = true;
    };
  };
}
