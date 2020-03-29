{pkgs, config, ...}:

{
  # for flatpak
  xdg.portal.enable = true;

  services = {
    flatpak = {
      enable = true;
    };

    xserver = {
      exportConfiguration = true; # link /usr/share/X11/ properly
      enable = true;
      layout = "us,bg";
      xkbOptions = "grp:switch,grp:alt_shift_toggle,grp_led:scroll";
      xkbVariant = ",phonetic";
      displayManager.startx.enable = true;
      libinput.enable = true;
    };

    postgresql = {
      enable = true;
      package = pkgs.postgresql;
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all ::1/128 trust
      '';
    };

    lorri.enable = true;
  };
}
