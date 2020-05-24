_: super: {
  comma = import ./comma.nix { inherit (super) fetchFromGitHub; } {};
}
