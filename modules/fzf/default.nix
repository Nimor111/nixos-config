{ pkgs, config, ... }:

{
  primary-user.home-manager = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
