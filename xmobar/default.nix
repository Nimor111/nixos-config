{pkgs, config, ...}:

let
  xmobarConfig = builtins.readFile ./.xmobarrc;
in
{
  home-manager.users.gbojinov = {
    home.file = {
      ".config/xmobar/.xmobarrc".text = xmobarConfig;
    };
  };
}
