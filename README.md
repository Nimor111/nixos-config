# Nixos configuration files

Steps to use:

* Create a new configuration in the `machine` directory (with a `default.nix` and a `hardware.nix`) and symlink it to `/etc/nixos/configuration.nix`.
* Run `sudo nixos-rebuild switch`.

Structure:

* `machine` - machine configurations
* `modules` - reusable chunks to build a machine configuration. Includes modules from `home-manager` and `nixos`
* `sources.*` - [niv](https://github.com/nmattia/niv) packages. Home manager is managed through `niv`.
