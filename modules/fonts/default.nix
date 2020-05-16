{pkgs, config, ...}:

{
  # fonts
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      fira-code
      iosevka
      powerline-fonts
      hack-font
      inconsolata-nerdfont
      jetbrainsmono-nerdfont
    ];
  };
}
