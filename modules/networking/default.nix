{pkgs, config, ...}:

{
  # Use wifi with network manager
  networking = {
    networkmanager.enable = true;
  };
}
