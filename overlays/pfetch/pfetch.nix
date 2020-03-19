{stdenv, fetchFromGitHub}:

stdenv.mkDerivation rec {
  name = "pfetch";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "dylanaraps";
    repo = "pfetch";
    rev = version;
    sha256 = "0yg9nlrjnm2404ysm2qp1klpq1wlmyih302kzfqchn6l2sibsm4j";
  };

  dontBuild = true;

  installPhase = ''
    install -Dm755 -t $out/bin pfetch
  '';
}
