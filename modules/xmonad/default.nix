{ pkgs, ... }:

let
  xmonadConfig = builtins.readFile ./xmonad.hs;
in
{
  primary-user.home-manager = {
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
