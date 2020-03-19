{stdenv, fetchFromGitHub}:

stdenv.mkDerivation rec {
  name = "pfetch";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "dylanaraps";
    repo = "pfetch";
    rev = version;
    sha256 = "06z0k1naw3k052p2z7241lx92rp5m07zlr0alx8pdm6mkc3c4v8f";
  };

  dontBuild = true;

  installPhase = ''
    install -Dm755 -t $out/bin pfetch
  '';
}
