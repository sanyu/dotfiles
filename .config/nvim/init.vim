" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc


" auto-install vim-plug
"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall
" endif
"
" call plug#begin('~/.config/nvim/plugged')

Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown

"General Plugins
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale' "Linting
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb'           " Dependency for tpope/fugitive

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'            " CtrlP is installed to support tag finding in vim-go
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}
Plug 'itchyny/calendar.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'shumphrey/fugitive-gitlab.vim' " gitlab for fugitive
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'rizzatti/dash.vim'             " Make API lookups using Dash

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplcache'        " Dependency for Shougo/neosnippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages


" Language Support
Plug 'neomake/neomake'                                        " Syntastic replacement
Plug 'google/vim-jsonnet', {'for': 'jsonnet'}                 " Jsonnet support
Plug 'hashivim/vim-vagrant', {'for': 'vagrant'}               " Vagrant support
Plug 'fatih/vim-go', {'for': 'go','do': ':GoInstallBinaries'} " Go support
Plug 'sebdah/vim-delve', {'for': 'go'}                        " Delve debbuger for Gob
" Plug 'zchee/deoplete-go', { 'do': 'make'}                     " Go autocompletion
Plug 'godoctor/godoctor.vim', {'for': 'go'}                   " Gocode refactoring tool
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}         " Dockerfiles support
Plug 'fishbullet/deoplete-ruby'                               " Ruby auto completion
Plug 'rodjek/vim-puppet'                                      " Puppet syntax highlighting
Plug 'chr4/nginx.vim'                                         " nginx syntax highlighting
Plug 'hashivim/vim-terraform'                                 " Terraform syntax highlighting
Plug 'plasticboy/vim-markdown'                                " Markdown syntax highlighting
Plug 'iamcco/markdown-preview.nvim',{ 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
Plug 'zimbatm/haproxy.vim'                                    " HAProxy syntax highlighting
Plug 'elzr/vim-json'                                          " Json syntax highlighting
Plug 'hashivim/vim-packer'                                    " Packer support
Plug 'tsandall/vim-rego'                                      " Rego support
Plug 'jelera/vim-javascript-syntax'                           " Javascript
Plug 'davidhalter/jedi-vim'                                   " Python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'} " Python
Plug 'tpope/vim-rails'                                        " Ruby
Plug 'tpope/vim-rake'                                         " Ruby
Plug 'tpope/vim-projectionist'                                " Ruby
Plug 'thoughtbot/vim-rspec'                                   " Ruby
Plug 'ecomba/vim-ruby-refactoring',{'tag':'main'}             " Ruby
Plug 'towolf/vim-helm'                                        " Helm Charts
Plug 'pearofducks/ansible-vim'                                " Ansible yaml
Plug 'lepture/vim-jinja'                                      " Jinja


" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors     " enable true colors support

"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme

set background=dark
"colorscheme one
" colorscheme ayu
colorscheme PaperColor
" colorscheme gruvbox
let g:airline_powerline_fonts = 1
let g:airline_theme='one'

" set fillchars+=vert:│
" hi VertSplit ctermbg=NONE guibg=NONE

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
" Plugin: fugitive-gitlab
"----------------------------------------------
let g:fugitive_gitlab_domains = ['https://cd.splunkdev.com/']

"----------------------------------------------
" Plugin: 'hashivim/vim-terraform'
"----------------------------------------------
let g:terraform_align=1
let g:terraform_fmt_on_save=1

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


"Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunctionfunction! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

"----------------------------------------------
" Plugin: 'fatih/vim-go.vim'
"----------------------------------------------

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })


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
let g:go_def_mode= 'gopls'
let g:go_info_mode='gopls'
" let g:go_info_mode='guru'
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
" Plugin: Shougo/neosnippet
"----------------------------------------------
" Keybindings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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

" " use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" " use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'auto_refresh_delay': 10,
\})

"----------------------------------------------
" Plug: 'neomake/neomake'
"----------------------------------------------
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
let g:neomake_open_list = 2
" neomake configuration for Go.
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }

" Configure signs.
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

"----------------------------------------------
" Plugin: Shougo/tabular.nvim
"----------------------------------------------
" source $HOME/.vim/after/plugin/tabularize.vim

"----------------------------------------------
" Plugin: SirVer/ultisnips
"----------------------------------------------
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

"----------------------------------------------
" Plugin: 'plasticboy/vim-markdown'
"----------------------------------------------
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1      " for YAML format
let g:vim_markdown_toml_frontmatter = 1 " for TOML format
let g:vim_markdown_json_frontmatter = 1 " for JSON format

"----------------------------------------------
" Speed up vim-go
"----------------------------------------------
" disable current line hilite
set nocursorcolumn
" color to col 128
set synmaxcol=128
syntax sync minlines=256
set re=1
set lazyredraw
:nnoremap <leader>b :GoDebugBreakpoint<CR>
:nnoremap <leader>n :GoDebugContinue<CR>

"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
" set clipboard=unnamedplus
" Copy to clipboard
vnoremap  <leader>y  "+y
set colorcolumn=81                " highlight the 80th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
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
set title                         " let vim set the terminal title
"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
