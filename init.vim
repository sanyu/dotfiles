" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
"

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif



call plug#begin('~/.config/nvim/plugged')

Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive
" Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet

"General Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'            " CtrlP is installed to support tag finding in vim-go
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/calendar.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim' " gitlab for fugitive
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Linting
Plug 'w0rp/ale'

" Language Support
Plug 'google/vim-jsonnet', {'for': 'jsonnet'}         " Jsonnet supportk
Plug 'hashivim/vim-vagrant', {'for': 'vagrant'}       " Vagrant support
Plug 'fatih/vim-go', {'for': 'go'}                    " Go support
Plug 'zchee/deoplete-go', { 'do': 'make'}             " Go autocompletion
Plug 'godoctor/godoctor.vim', {'for': 'go'}           " Gocode refactoring tool
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'fishbullet/deoplete-ruby'                       " Ruby auto completion
Plug 'rodjek/vim-puppet'                              " Puppet syntax highlighting
Plug 'chr4/nginx.vim'                                 " nginx syntax highlighting
Plug 'hashivim/vim-terraform'                         " Terraform syntax highlighting
Plug 'plasticboy/vim-markdown'                        " Markdown syntax highlighting
Plug 'zimbatm/haproxy.vim'                            " HAProxy syntax highlighting
Plug 'elzr/vim-json'                                  " Json syntax highlighting
Plug 'hashivim/vim-packer'                            " Packer support

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'

call plug#end()

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set termguicolors     " enable true colors support
let g:airline_powerline_fonts = 1
let g:airline_theme='one'

"set background=dark
"colorscheme one

"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu

"----------------------------------------------
" Plugin: 'itchyny/calendar.vim'
"----------------------------------------------
" Enable Google Calendar integration.
let g:calendar_google_calendar = 1

" Enable Google Tasks integration.
let g:calendar_google_task = 1

" Other options
let g:calendar_first_day = "monday"           " Weeks starts with Monday
let g:calendar_date_endian = "big"            " Format: year / month / day
let g:calendar_date_separator = "-"           " Format: year - month - day
let g:calendar_week_number = 1                " Show week numbers
let g:calendar_view = "days"                  " Set days as the default view

"----------------------------------------------
" Plugin: 'ctrlpvim/ctrlp.vim'
"----------------------------------------------
" Note: We are not using CtrlP much in this configuration. But vim-go depend on
" it to run GoDecls(Dir).

" Disable the CtrlP mapping, since we want to use FZF instead for <c-p>.
let g:ctrlp_map = ''

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>d :NERDTreeToggle<cr>

"----------------------------------------------
" Plugin: fzf
"----------------------------------------------
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>a :Ag<Space>



" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Set neosnippet as snippet engine
let g:go_snippet_engine = "neosnippet"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" let g:go_gocode_propose_source=1

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"


"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
"function! Multiple_cursors_before()
"    let b:deoplete_disable_auto_complete = 1
"endfunction

"function! Multiple_cursors_after()
"    let b:deoplete_disable_auto_complete = 0
"endfunction

" let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'
let g:deoplete#sources#go#source_importer = 1

call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'auto_refresh_delay': 10,
\})

"----------------------------------------------
" Plugin: Shougo/tabular.nvim
"----------------------------------------------
source $HOME/.vim/after/plugin/tabularize.vim

"----------------------------------------------
" Plugin: SirVer/ultisnips
"----------------------------------------------
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set colorcolumn=81                " highlight the 80th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
