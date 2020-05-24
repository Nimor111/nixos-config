{ fetchFromGitHub }:

let
  version = "master";

  src = fetchFromGitHub {
    owner = "Shopify";
    repo = "comma";
    rev = version;
    sha256 = "0n5a3rnv9qnnsrl76kpi6dmaxmwj1mpdd2g0b4n1wfimqfaz6gi1";
  };
in
import src
