filetype off
" Autoinstall Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'LLluma/Vim-Jinja2-Syntax'
Plug 'LLluma/molokai'
Plug 'LLluma/rope-vim'
Plug 'SirVer/ultisnips'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'blindFS/vim-taskwarrior'
Plug 'chr4/nginx.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala'
Plug 'dhruvasagar/vim-zoom'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
Plug 'kovetskiy/sxhkd-vim'
Plug 'lambdalisue/vim-pyenv'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lukaszb/vim-web-indent'
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'python/black'
Plug 'roxma/vim-tmux-clipboard'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'takac/vim-hardtime'
Plug 'tbabej/taskwiki'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/confluencewiki.vim'
Plug 'vim-scripts/todo-txt.vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev'}
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Hard time always
let g:hardtime_default_on = 1

" Gutentag
let g:gutentags_ctags_tagfile = '.git/tags'


filetype plugin indent on

set nocompatible               " be iMproved

let mapleader = ","
let maplocalleader = ","
set scrolloff=3
set fillchars=""


"Change terminal cursor in insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"Lightline settings
let g:lightline = { 'colorscheme': 'one' }
let g:lightline.mode_map = {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'V-L',
            \ "\<C-v>": 'V-B',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'S-L',
            \ "\<C-s>": 'S-B',
            \ 't': 'T',
            \ }

"FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>g :GFiles?<CR>

"ALE
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'python': ['flake8', 'pyflakes'],
\   'ruby': ['rubocop', 'brakeman'],
\   'yaml': ['cfn-lint'],
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   '*': ['trim_whitespace', 'remove_trailing_lines'],
\   'javascript': ['eslint'],
\   'c': ['clangtidy', 'clang-format'],
\   'python': ['isort', 'black']
\}
let g:ale_python_isort_options = '--multi-line=3 --trailing-comma --wrap-length=100'
let g:ale_python_flake8_options = '--max-line-length=100'
let g:ale_c_clangformat_options = '--style=LLVM'
nnoremap <leader>e :ALEFix<CR>

" turn hybrid line numbers on
set number relativenumber
set nu rnu

"Spell
set spelllang=en_us

filetype plugin indent on     " required!
set numberwidth=3
" Switch to alternate file
nnoremap <Tab> :bNext!<cr>
nnoremap <S-Tab> :bprevious!<cr>

set colorcolumn=119

set go+=a               " Visual selection automatically copied to the clipboard<Paste>

vnoremap < <gv
vnoremap > >gv

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

set backupdir=~/.backup,/tmp
set directory=~/.backup,/tmp

set nowrap
set number

" General Settings

set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

set undofile
set undolevels=5000
set undodir=$HOME/.vim/undo
if !isdirectory(&undodir)
    call mkdir(&undodir)
endif



filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Compile suckless program
au! BufWritePost config.h !sudo make install

" Reload sxhkd config
au! BufWritePost sxhkdrc !killall sxhkd -10


syntax on
set hlsearch
set cursorline

syntax enable
set t_Co=256
let g:rehash256=1
colorscheme molokai

set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set t_vb=
set tm=500

set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

" status line {
set laststatus=2

" set leader to ,
let mapleader=","
let g:mapleader=","

" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>
set hidden
set mouse=a
set incsearch
set ignorecase
set smartcase
set linebreak


"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

"Ignore list for netrw
let g:netrw_list_hide= '.*\.pyc$\|.*\.un\~$'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

set statusline+=%#warningmsg#
set statusline+=%*

set tags="./.tags,~/.vimtags,./.git/tags"

set textwidth=119
set colorcolumn=+1

"Misc
set timeoutlen=1000

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc

let g:pydoc_open_cmd = 'vsplit'
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
