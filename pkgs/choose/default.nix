{ lib, fetchFromGitHub, rustPlatform, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "choose";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "theryangeary";
    repo = "choose";
    rev = "v${version}";
    sha256 = "1ilg0binywqbdjvc9qi5lphyhdh5ln0m69hp0myijfcy3skz280r";
  };

  cargoSha256 = "1qys7v3436bi8mc66sij6cm9wmm63jwh4qfz6n9kms4944wn5cia";

  nativeBuildInputs = [ installShellFiles ];

  meta = with lib; {
    description = "A human-friendly and fast alternative to awk and cut";
    longDescription = ''
      Choose is not meant to be a drop-in or complete replacement for either of the awk and cut tools,
      but rather a simple and intuitive tool to reach for when the basics of awk or cut will do,
      but the overhead of getting them to behave should not be necessary.
    '';
    homepage = "https://github.com/theryangeary/choose";
    license = with licenses; [ gpl3 ];
    maintainers = with maintainers; [ theryangeary ];
    platforms = platforms.all;
  };
}
