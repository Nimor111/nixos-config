{pkgs, ...}:

{
  ################
  # macOS config #
  ################

  fonts.enableFontDir = true;
  fonts.fonts = [
    pkgs.jetbrains-mono
  ];

  system.defaults = {
    finder.AppleShowAllExtensions = true;
    dock = {
      autohide = true;
      orientation = "right";
      show-recents = false;
      tilesize = 48;  # Default value is 64.
    };
  };
}
