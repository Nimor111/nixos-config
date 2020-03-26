{pkgs, config, ...}:

let
  plugins = pkgs.vimPlugins // pkgs.callPackage ./custom-plugins.nix {};
  vimConfig = builtins.readFile ./init.vim;
in
  {
    home-manager.users.gbojinov = {
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        configure = {
          customRC = vimConfig;
          packages.myVimPackage = {
            start = [
              plugins.vim-nix
              plugins.vim-multiple-cursors
              plugins.vim-highlightedyank
              plugins.vim-auto-save
              plugins.vim-airline
              plugins.vim-airline-themes
              plugins.vim-elixir
              plugins.nerdcommenter
              plugins.nerdtree
              plugins.ctrlp
              plugins.gruvbox
              plugins.haskell-vim
              plugins.ghcid
              plugins.neomake
              plugins.supertab
              plugins.deoplete-nvim
              plugins.coc-nvim

              # python plugins
              plugins.deoplete-jedi
              plugins.jedi-vim

              # elm
              plugins.elm-vim
            ];
            opt = [ ];
          };
        };
        extraPython3Packages = (ps: with ps; [ jedi pynvim ]);
      };
    };
  }
