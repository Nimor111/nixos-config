{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    home.file = {
      ".xinitrc".text = ''
        # this is some android studio/idea garbage
        export _JAVA_AWT_WM_NONREPARENTING=1

        # Start wm
        exec xmonad
      '';
    };
  };
}
