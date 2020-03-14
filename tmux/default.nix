{pkgs, config, ...}:

let
  tmuxConfig = builtins.readFile ./tmux.conf;
in
{
  home-manager.users.gbojinov = {
    programs.tmux = {
      enable = true;

      extraConfig = tmuxConfig;
    };
  };
}
