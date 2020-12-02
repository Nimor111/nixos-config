self: _: {
  comma = import ../../pkgs/comma { inherit (self) fetchFromGitHub; } { };
}
