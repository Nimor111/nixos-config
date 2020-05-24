{ ... }:

let
  xmobarConfig = builtins.readFile ./.xmobarrc;
in
{
  primary-user.home-manager = {
    xdg.configFile."xmobar/.xmobarrc".text = xmobarConfig;
  };
}
