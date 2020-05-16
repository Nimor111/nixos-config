{pkgs, config, ...}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  primary-user.shell = pkgs.zsh;
  primary-user.extraGroups = [
    "wheel" # Enable ‘sudo’ for the user.
    "audio"
    "docker" # Don't use sudo for docker
  ];
  primary-user.isNormalUser = true;
}
