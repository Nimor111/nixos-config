{pkgs, config, ...}:

let
  i3modifier = "Mod4";
in

  {
    home-manager.users.gbojinov = homeManager: {
      xsession = {
        enable = true;

        windowManager.i3 = {
          enable = true;
          config = {
            modifier = "${i3modifier}";
            keybindings = pkgs.lib.mkOptionDefault {
              "${i3modifier}+Return" = "exec termite";
            };
          };
          extraConfig = ''
          '';
        };
      };
    };
  }
