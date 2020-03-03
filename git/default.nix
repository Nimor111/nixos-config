{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    programs.git = {
      enable = true;
      userName = "Nimor111";
      userEmail = "georgi.bojinov@hotmail.com";
      extraConfig = {
        alias = {
          co = "checkout";
          br = "branch";
          ci = "commit";
          st = "status";
        };
      };
    };
  };
}
