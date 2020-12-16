{ ... }:

{
  primary-user.home-manager = {
    programs.alacritty = {
      enable = true;
      settings = {
        # Challenger deep theme
        colors = import ./challenger-deep.nix { };
        font = {
          normal = {
            family = "JetBrainsMono NF";
          };
          size = 20.0;
          use_thin_strokes = true;
        };
      };
    };
  };
}
