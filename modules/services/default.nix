{pkgs, config, ...}:

{
  imports = [
    ./lorri
    ./xserver
    ./flatpak
    ./postgresql
    ./gpg
  ];
}
