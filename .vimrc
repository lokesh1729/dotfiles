" ============== Functions and Misc =============
" Search only under selected region
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction

"=========== Plugins ===========
if has('nvim')
    let s:plug_path = '~/.local/share/nvim/site/autoload/plug.vim'
    let g:python_host_prog  = '/usr/bin/python2'
    let g:python3_host_prog = '/Users/slokesh/.pyenv/versions/3.6.5/bin/python'
    let g:ruby_host_prog = '/usr/local/opt/ruby/bin/ruby'
    let s:plugged_path = '~/.local/share/nvim/plugged'
else
    let s:plug_path = '~/.vim/autoload/plug.vim'
    let s:plugged_path = '~/.vim/plugged'
endif

if !filereadable(expand(s:plug_path))
    echo 'Installing vim-plug...'
    echo ''
    execute "silent !curl -fLo " . s:plug_path . " --create-dirs "
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    " Install plugins after loading vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(s:plugged_path)
exec printf('source %s/%s', s:plugged_path, '/plugin/bclose.vim')
exec printf('source %s/%s', s:plugged_path, '/plugin/IndexedSearch.vim')

" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
" Maybe the best Git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Airline
Plug 'vim-airline/vim-airline'
"alternative to SimpyLFold
Plug 'Konfekt/FastFold'
" bookmarks
Plug 'MattesGroeger/vim-bookmarks'
" ConfirmQuit
Plug 'vim-scripts/ConfirmQuit.vim'
" Vim Ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-unimpaired'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0
Plug 'heavenshell/vim-pydocstring'
Plug 'Xuyuanp/nerdtree-git-plugin'
if has('nvim')
    Plug 'skywind3000/asyncrun.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'python-mode/python-mode', { 'branch': 'develop' }
    Plug 'Shougo/context_filetype.vim'
    Plug 'zchee/deoplete-jedi'
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'ryanoasis/vim-devicons'
    set encoding=UTF-8
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    let g:deoplete#enable_at_startup = 1
    imap <C-k>  <Plug>(neosnippet_expand_or_jump)
    smap <C-k>  <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>  <Plug>(neosnippet_expand_target)
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    run UpdateRemotePlugins
    run TagsGenerate!
else
    Plug 'davidhalter/jedi-vim'
endif
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'alvan/vim-closetag'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
" colorschemes
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ap/vim-css-color'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
call plug#end()
" ==================== Settings =================
" Vim settings and mappings
set nocompatible
filetype plugin on
filetype indent on
filetype on
" highlight cursor line and column
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cursorline
set cursorcolumn
" hidden startup messages
set shortmess=atI
" auto read and write
set autowrite
set autoread
" when deal with unsaved files ask what to do
set confirm
set background=dark
set encoding=utf-8
set backspace=indent,eol,start
" hidden some types files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd vimenter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p
" always show status bar
set laststatus=2
" incremental search
set incsearch
" highlighted search results
set hlsearch
" search ignore case
set ignorecase
" syntax highlight on
syntax on
" show line numbers
set nu
" Enable folding
set foldmethod=indent
set foldlevel=99
set tw=100
"Set no wrap
set nowrap
set formatoptions=l
set shortmess+=c

" ============== Global Variables ==============
let g:vim_tags_directories = ['.']
" autofocus on tagbar open
let g:tagbar_autofocus = 1
let g:jedi#completions_command = "<C-N>"
let g:ack_default_options = " --ackrc /Users/slokesh/.ackrc --nocolor --nogroup -s "
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\~$']
let g:NERDTreeWinSize = 18
" file finder mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_path_nolim = 1
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|venv|\.venv|env)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }
let g:ctrlp_extensions = ['buffertag', 'quickfix',  'undo', 'line', 'changes', 'mixed']
let g:ctrlp_cmdpalette_execute = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:bookmark_highlight_lines = 1
" don't open nerd tree on startup FFS
let g:NERDTreeHijackNetrw=0
let g:ale_fixers = {'python':
            \['isort', 'add_blank_lines_for_python_control_statements', 'black'],
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['importjs', 'prettier', 'eslint'],
            \'html': ['prettier'],
            \'css': ['prettier', 'stylelint']}
let g:ale_linters = {'css': ['csslint', 'prettier'],
            \'html': ['htmlhint', 'alex'],
            \'javascript': ['eslint'],
            \'python': ['flake8', 'pylint']} " flake8 = pycodestyle + pyflakes
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
" let g:ale_python_pylint_options = "--init-hook=\"import os, sys; sys.path.append(os.path.dirname('/Users/slokesh/work/mss_ps_api/src/ab-www/'))\" --rcfile=/Users/slokesh/.pylintrc"
let g:kite_next_placeholder='<leader>j'
let g:kite_previous_placeholder='<leader>k'
let g:custom_vimrc='no'
"let g:pymode_python = 'python3'
"let g:pymode_lint_cwindow = 0
"let g:pymode_lint = 0
"let g:pymode_lint_on_write = 0
"let g:pymode_rope = 0
"let g:pymode_lint_checkers = [] " even though virtualenv is activated, imports are still showing errors

" ============== Key Mappings ===================
nnoremap <C-b> :CtrlPCmdPalette<CR>
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move between tabs
nnoremap tn <ESC>:tabn<CR>
nnoremap tp <ESC>:tabp<CR>
nnoremap tc <ESC>:bdelete<CR>
nnoremap bd <ESC>:bdelete<CR>
" Move between Buffers alt + [ and alt + ]
nnoremap “ :bprevious<CR>
nnoremap ‘ :bnext<CR>
"Find tags
nnoremap <C-f> :Ack!
nnoremap ts :exec("ts /".expand("<cword>"))<CR>
noremap Y y$
"Open tag definition in new tab http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
nnoremap « :tab split<CR>:exec("ts /".expand("<cword>"))<CR>
"matching tags
nnoremap <C-]> g<C-]>
noremap <C-e> :exec('Ack! '.expand("<cword>"))<CR>
"Search for selected text
vnoremap // y/<C-R>"<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
" open nerdtree with the current file selected
nmap ,n :NERDTreeFind<CR>
" CtrlP
"mapping to CtrlB for Searching Buffers
nmap ,b :CtrlPBuffer<CR>
" tags (symbols) in current file finder mapping
nmap ,t :CtrlPBufTagAll<CR>
nmap ,o :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,l :CtrlPLine<CR>
" toggle nerdtree display
map <C-n> :NERDTreeToggle<CR>
nmap bm <Plug>BookmarkToggle
nmap ba <Plug>BookmarkAnnotate
nmap bs <Plug>BookmarkShowAll
nmap bn <Plug>BookmarkNext
nmap bp <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
"Find refernces ctrl + ?
nmap <silent> <C-_> <Plug>(pydocstring)
nmap <F6> <Plug>(ale_fix)
"Open tag in vertical split
map <C-\> :vsp <CR>:exec("ts /".expand("<cword>"))<CR>
map g-Ctrl-] which goes to matching tag if only one else gives list of

" ======================== Misc ========================
if has('gui_vimr')
    " colorscheme dracula
    "colorscheme gruvbox
    set termguicolors     " enable true colors support
    let ayucolor="light"  " for light version of theme
    let ayucolor="mirage" " for mirage version of theme
    let ayucolor="dark"   " for dark version of theme
    colorscheme ayu
    set guifont=FiraCode\ Nerd\ Font\ Mono:h18
else
    colorscheme spaceduck
    "colorscheme molokai
endif
if $PWD != $HOME && filereadable($PWD .'/.vimrc')
  source ./.vimrc
  g:custom_vimrc='yes'
endif
if has('unix') && empty($TMPDIR)
    let $TMPDIR = '/tmp'
endif
