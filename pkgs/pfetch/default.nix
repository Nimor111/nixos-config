{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "pfetch";
  version = "e74081fa469287bee7e2fd35f7d1cb7b1ea19d2f";

  src = fetchFromGitHub {
    owner = "dylanaraps";
    repo = "pfetch";
    rev = version;
    sha256 = "0fnlihq45hcljwshadklb6f9m95042r34x2i2imq8b946a6v1glp";
  };

  dontBuild = true;

  installPhase = ''
    install -Dm755 -t $out/bin pfetch
  '';
}
