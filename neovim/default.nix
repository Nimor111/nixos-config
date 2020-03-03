{pkgs, config, ...}:

let
  plugins = pkgs.vimPlugins // pkgs.callPackage ./custom-plugins.nix {};
in
  {
    home-manager.users.gbojinov = {
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        configure = {
          customRC = ''
          " spaces instead of tabs
          set expandtab

          set shiftwidth=4
          set tabstop=4

          " line numbers relative to current position of cursor
          set number
          set relativenumber

          " map the leader key to space
          let mapleader = ' '

          " airline theme
          let g:airline_theme='bubblegum'

          " nerdcommenter - turn off automatic comment insertion
          autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

          " start nerdtree automatically with vim
          " close vim if only nerdtree is open
          augroup nerdtree
                autocmd vimenter * NERDTree
                autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
          augroup END

          " map turn on NERDTree key
          map <Leader>k :NERDTreeToggle<CR>

          " colorscheme
          colorscheme gruvbox

          " highlight the screen line of the cursor
          set cursorline

          " show whitespace as .
          set list
          set listchars=tab:\ \ ,trail:·

          " clear all trailing whitespace on save
          autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e

          " switch tabs
          nnoremap <C-J> <C-W><C-J>
          nnoremap <C-K> <C-W><C-K>
          nnoremap <C-L> <C-W><C-L>
          nnoremap <C-H> <C-W><C-H>

          " set spacing
          autocmd FileType haskell setlocal shiftwidth=4 softtabstop=2 expandtab

          " map turning off highlighting in searches
          nmap <leader>f :set nohlsearch<CR>

          " jedi-vim settings
          let g:jedi#auto_initialization = 1
          let g:jedi#show_call_signatures = '2'

          " since we're using deoplete for completions
          let g:jedi#completions_enabled = 0

          let g:jedi#goto_command = '<leader>d'
          let g:jedi#goto_assignments_command = '<leader>g'
          let g:jedi#goto_definitions_command = '<leader>gg'
          let g:jedi#documentation_command = 'K'
          let g:jedi#usages_command = '<leader>n'
          let g:jedi#completions_command = '<C-Space>'
          let g:jedi#rename_command = '<leader>r'

          " deoplete
          let g:deoplete#enable_at_startup = 1

          " python linter
          let g:neomake_python_enabled_makers = ['flake8']

          " automatic linting
          autocmd BufEnter * call neomake#configure#automake('nrwi', 100)

          " open quickfix window on neomake errors
          let g:neomake_open_list = 2
          '';
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

              # python plugins
              plugins.deoplete-jedi
              plugins.jedi-vim
            ];
            opt = [ ];
          };
        };
        extraPython3Packages = (ps: with ps; [ jedi pynvim ]);
      };
    };
  }
