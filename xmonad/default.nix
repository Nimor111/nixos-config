{pkgs, config, ...}:

let
  xmonadConfig = builtins.readFile ./xmonad.hs;
in
{
  home-manager.users.gbojinov = {
    xsession = {
      enable = true;

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;

        config = pkgs.writeText "xmonad.hs" xmonadConfig;
      };
    };
  };
}
