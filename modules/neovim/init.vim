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

" deoplete - enable at startup
let g:deoplete#enable_at_startup = 1

" disable deoplete in elm files
autocmd FileType elm
\ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete in typescript.tsx files
autocmd FileType typescript.tsx
\ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete in typescript files
autocmd FileType typescript
\ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete in rust files
autocmd FileType rust
\ call deoplete#custom#buffer_option('auto_complete', v:false)

" python linter
let g:neomake_python_enabled_makers = ['flake8']

" automatic linting
autocmd BufEnter * call neomake#configure#automake('nrwi', 100)

" open quickfix window on neomake errors
let g:neomake_open_list = 2

" coc.nvim GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" map keys for vifm.vim
map <leader>vv :Vifm<CR>

" use :Prettier to format buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" format with Prettier on save
augroup typescripttsx
    au!
    autocmd FileType typescript.tsx,typescript autocmd BufWritePre <buffer> :Prettier
augroup END

" disable coc for purescript
augroup coc-haskell
  " deletes command
  autocmd!
  au BufEnter *.purs :CocDisable
augroup END
