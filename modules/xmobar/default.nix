{pkgs, config, ...}:

let
  xmobarConfig = builtins.readFile ./.xmobarrc;
in
{
  home-manager.users.gbojinov = {
    xdg.configFile."xmobar/.xmobarrc".text = xmobarConfig;
  };
}
