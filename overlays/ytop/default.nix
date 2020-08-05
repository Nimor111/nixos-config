self: _: {
  ytop = self.callPackage ../../pkgs/ytop {
    inherit (self.darwin.apple_sdk.frameworks) IOKit;
  };
}
