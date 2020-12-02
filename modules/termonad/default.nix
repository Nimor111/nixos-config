{ ... }:
let
  termonadConfig = builtins.readFile ./termonad.hs;
in
{
  primary-user.home-manager = {
    xdg.configFile."termonad/termonad.hs".text = termonadConfig;
  };
}
