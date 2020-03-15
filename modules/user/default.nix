{pkgs, config, ...}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gbojinov = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "audio"
      "docker" # Don't use sudo for docker
    ];
  };
}
