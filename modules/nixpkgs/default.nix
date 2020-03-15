{pkgs, config, ...}:

{
  # install proprietary packages
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
