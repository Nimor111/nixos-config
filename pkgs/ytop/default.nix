{ stdenv, rustPlatform, fetchFromGitHub, IOKit }:

assert stdenv.isDarwin -> IOKit != null;

rustPlatform.buildRustPackage rec {
  pname = "ytop_6";
  version = "0.6.2";

  src = fetchFromGitHub {
    owner = "cjbassi";
    repo = pname;
    rev = version;
    sha256 = "02cpn5257yrmbakx3mlqs97kfambbn9ljb60jbqr1b9w24kd6zgf";
  };

  buildInputs = stdenv.lib.optionals stdenv.isDarwin [ IOKit ];

  cargoSha256 = "14bghpfa856gsz815hnlarzd0a48g89k1l9vp5niigbi741mmfrd";

  meta = with stdenv.lib; {
    description = "A TUI system monitor written in Rust";
    homepage = "https://github.com/cjbassi/ytop";
    license = licenses.mit;
    maintainers = with maintainers; [ sikmir ];
    platforms = platforms.unix;
  };
}
