{ config, ... }:

{
  primary-user.home-manager = {
    programs.git = {
      enable = true;
      userName = config.primary-user.userName;
      userEmail = config.primary-user.email;
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
