{pkgs, config, ...}:

let
  i3modifier = "Mod4";
in

  {
    primary-user.home-manager = {
      xsession = {
        enable = true;
        scriptPath = ".xsession";

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
