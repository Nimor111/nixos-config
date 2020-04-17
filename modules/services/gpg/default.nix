{pkgs, lib, ...}:

{
  home-manager.users.gbojinov = {
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
