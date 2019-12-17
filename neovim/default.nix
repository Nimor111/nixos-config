{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = [
        pkgs.vimPlugins.vim-nix
	pkgs.vimPlugins.vim-multiple-cursors
	pkgs.vimPlugins.vim-highlightedyank
        # pkgs.vimPlugins.vim-devicons
	pkgs.vimPlugins.vim-auto-save
	pkgs.vimPlugins.vim-airline
	pkgs.vimPlugins.vim-airline-themes
	pkgs.vimPlugins.nerdcommenter
	pkgs.vimPlugins.nerdtree
	pkgs.vimPlugins.ctrlp
	pkgs.vimPlugins.gruvbox
        pkgs.vimPlugins.haskell-vim
      ];
      extraConfig = ''
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
      '';
    };
  };
}
