{ pkgs, config, ... }:

{
  primary-user.home-manager = {
    programs.zathura = {
      enable = true;
      options = {
        zoom-step = 20;
        scroll-step = 80;
        selection-clipboard = "clipboard";
        incremental-search = true;
        font = "monospace normal 16";
      };
      extraConfig = ''
        map <C-i> zoom in
        map <C-l> zoom out
      '';
    };
  };
}
