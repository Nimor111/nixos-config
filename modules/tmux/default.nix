{ ... }:
let
  tmuxConfig = builtins.readFile ./tmux.conf;
in
{
  primary-user.home-manager = {
    programs.tmux = {
      enable = true;

      extraConfig = tmuxConfig;
    };
  };
}
