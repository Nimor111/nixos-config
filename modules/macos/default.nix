{pkgs, ...}:

{
  ################
  # macOS config #
  ################

  fonts.enableFontDir = true;
  fonts.fonts = [
    pkgs.jetbrains-mono
  ];

  system.defaults.finder.AppleShowAllExtensions = true;

  system.defaults.dock.autohide = true;
  system.defaults.dock.orientation = "right";
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 48;  # Default value is 64.
}

