{pkgs, config, ...}:

{
  boot = {
    # Use the GRUB 2 boot loader.
    loader.grub.enable = true;
    loader.grub.version = 2;
    # Define on which hard drive you want to install Grub.
    loader.grub.device = "/dev/sda";
    # Add Arch Linux on /dev/sda1 to grub entries
    loader.grub.extraEntries = ''
      menuentry 'Arch Linux' {
        configfile (hd0,1)/boot/grub/grub.cfg
      }
    '';
    # always used latest available kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
