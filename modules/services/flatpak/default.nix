{pkgs, config, ...}:

{
  xdg.portal.enable = true;

  services = {
    flatpak.enable = true;
  };
}
