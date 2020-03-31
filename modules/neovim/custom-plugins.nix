{ pkgs, ... }:

{
  # nix-prefetch-git <git-url>
  # plugin-name = pkgs.vimUtils.buildVimPlugin {
    # name = "plugin-name";
    # src = pkgs.fetchFromGitHub {
      # owner = "plugin-org";
      # repo = "plugin-repo";
      # rev = "<ref>";
      # sha256 = "<sha256>";
    # };
  # };

   vifm-vim-custom = pkgs.vimUtils.buildVimPlugin {
     name = "vifm-vim-custom";
     src = pkgs.fetchFromGitHub {
       owner = "vifm";
       repo = "vifm.vim";
       rev = "0de5d3e5b2519881688849ce571464959c0ce692";
       sha256 = "1qj3lk52ql7x8zr7ngb2hlaixwxlzqc9qxv5h73478nv4wkb16z1";
     };
   };
}
