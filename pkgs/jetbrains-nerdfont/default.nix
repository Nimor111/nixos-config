{ lib, fetchzip }:
let
  version = "2.1.0";
in
fetchzip {
  name = "jetbrainsmono-nerdfont-${version}";

  url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/JetBrainsMono.zip";

  postFetch = ''
    mkdir -p $out/share/fonts/jetbrainsmono-nerdfont
    unzip -j $downloadedFile -d $out/share/fonts/jetbrainsmono-nerdfont
  '';

  sha256 = "1w9a8k1mwnlgmg5dii9mddwdhiazhw1yv25c9p74y1mq508j1j9h";

  meta = with lib; {
    description = ''
      Nerd Fonts is a project that attempts to patch as many developer targeted
      and/or used fonts as possible. The patch is to specifically add a high
      number of additional glyphs from popular 'iconic fonts' such as Font
      Awesome, Devicons, Octicons, and others.
    '';
    homepage = https://github.com/ryanoasis/nerd-fonts;
    license = licenses.mit;
    platforms = platforms.all;
  };
}
