{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    programs.zathura = {
      enable = true;
      options = {
        zoom-step = 20;
	scroll-step = 80;
	selection-clipboard = "clipboard";
	incremental-search = true;
      };
      extraConfig = ''
	map <C-i> zoom in
	map <C-l> zoom out
      '';
    };
  };
}
