{pkgs, lib, ...}:

{
  primary-user.home-manager = {
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
