set encoding=utf-8
let emmetFiles = ["html","xhtml","xml","xaml","xsd","xsl","css","less","scss","sass","styl","svg"]


call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'nono/vim-handlebars'
Plug 'machakann/vim-highlightedyank'
Plug 'janko-m/vim-test'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'

"COMMON
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', { 'for': emmetFiles }
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

"PHP
Plug 'stanangeloff/php.vim', { 'for': 'php' }

"RUBY
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'rdolgushin/groovy.vim'

"GOLANG
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nsf/gocode', { 'for': 'go' }

"JAVASCRIPT
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

"RUST
Plug 'rust-lang/rust.vim'

call plug#end()

let mapleader=","


syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"ultiSnips settings
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


"jsx setting
let g:jsx_ext_required = 0

"NerdTree
let g:NERDTreeWinPos = "right"
nnoremap <silent> <Leader>\ :NERDTreeToggle<CR>

set relativenumber
set number
set nowrap

nnoremap <silent> <Leader><space> :noh<CR>
nmap ; :
nmap <silent> ss :sp<CR>
nmap <silent> vv :vs<CR>

source ~/dotfiles/nvim/neomake_settings.vim
source ~/dotfiles/nvim/lightline_settings.vim
source ~/dotfiles/nvim/fzf_settings.vim
source ~/dotfiles/nvim/search_settings.vim

if !isdirectory($HOME."/.config/nvim/undo-dir")
  call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif

set undodir=~/.config/nvim/undo-dir
set undofile

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/temp
set inccommand=nosplit

let g:webdevicons_enable_nerdtree = 1
let g:rubycomplete_rails = 1

"vim-test options
" make test commands execute using dispatch.vim
let test#strategy = "neomake"

nmap <silent> <leader>p :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"Ctrl HJKL navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-l> <c-\><c-n><c-w>l

  nnoremap <a-h> <c-w>h
  nnoremap <a-j> <c-w>j
  nnoremap <a-k> <c-w>k
  nnoremap <a-l> <c-w>l
endif
