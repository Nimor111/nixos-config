{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    programs.neovim = {
      enable = true;
    };
  };
}
