syntax on
" sane default settings
set guicursor=
set relativenumber
set nu
set hidden
set noerrorbells
set nowrap
set noshowmode
set updatetime=50
set shortmess+=c
"tab
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
"undo
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
"searching
set nohlsearch
set incsearch
"prettier and better
set termguicolors
set cmdheight=2
"set signcolumn=number
set signcolumn=yes
"vertical navigation
set scrolloff=8

"Plugins
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'takac/vim-hardtime'
Plug 'dbeniamine/cheat.sh-vim'
"Plug 'mhinz/vim-signify'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'vim-airline/vim-airline'
"Plug 'romgrk/barbar.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

"----------------Theeming ------------------
"Guvbox
let g:gruvbox_contrast_dark = 'hard'
" if exists('+termguicolors')
    " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
let g:gruvbox_invert_selection='0'
" let g:gruvbox_contrast_dark
colorscheme gruvbox
set background=dark
" let g:gruvbox_colors = { 'dark0_hard': 9 }
"let g:gruvbox_colors = { 'dark4_256': 16 }
let g:gruvbox_colors = { 'bg0': 0 }
let g:gruvbox_termcolors=16
"Airline
" let g:airline#extensions#tabline#enabled = 1
" BarBar
" let bufferline = get(g:, 'bufferline', {})
" let bufferline.icon_close_tab = ' '
"-----------------------------------------

"fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS="--reverse --bind 'tab:down,shift-tab:up'"
" Vim HardTime
let g:hardtime_default_on = 0
"polyglot
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

"maps
let mapleader = " "
"meta
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>ei :e ~/.config/nvim/init.vim <CR>

"----------SANE-KEYBINDINGS-----------------------
nnoremap Y y$
"clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
"maps:splits
nnoremap <leader>sl :rightb vsp <CR>
nnoremap <leader>sh :vsp <CR>
nnoremap <leader>sk :leftabove sp <CR>
nnoremap <leader>sk :sp <CR>
nnoremap <leader>+ :vertical resize +5 <CR>
nnoremap <leader>- :vertical resize -5 <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
"maps:fzf
nnoremap <C-p> :GFiles <CR>
nnoremap <leader>pg :Rg <CR>
nnoremap <leader>pf :Files <CR>
nnoremap <leader>pb :Buffers <CR>
"maps:buffers (barbar)
nnoremap <leader>bn :BufferNext <CR>
nnoremap <leader>bp :BufferPrevious <CR>
"maps:cht.sh
"
"maps:coc
"coc:GoTo Navigation
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>gs :CocCommand clangd.switchSourceHeader <CR>
nmap <leader>cn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
"coc: show stuff, make it beautiful
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> K :call <SID>show_documentation()<CR>
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"coc:autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Highlight the symbol and its references when holding the cursor.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"coc:snippets
imap <C-l> <Plug>(coc-snippets-expand)
"let g:coc_snippet_next = '<tab>'
let g:coc_snippet_next = '<C-j>'
let g:coc_snnipet_prev = '<C-k>'


"--functions--
"trim whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
"highlight yank
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd BufWritePre * :call TrimWhitespace()

" autocmd BufNewFile "" call fzf#install()
