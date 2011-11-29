runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
set nocompatible 
syntax on
set hlsearch
set incsearch
set number
set cursorline

runtime! macros/matchit.vi
filetype plugin indent on 
colorscheme vibrantink

" Mappings
" :map <C-d> :execute 'NERDTree '<CR>
:map <C-d> :NERDTreeToggle<CR>
" Number lines on/off    
map <F2> :set number!<CR>
map! <F2> <ESC><F2> i

" Make trailing space visible  
map <F4> :set hls<CR>/\s\+$<CR>
map! <F4> <ESC><F4>i"

" Highlight on/off
map <F7> :set hls!<CR><Bar>:echo "HLSearch: " . strpart("OffOn", 3 * &hlsearch, 3)<CR>
map! <F7> <ESC><F7>i"


inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermfg=3 ctermbg=1 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=3 gui=bold,reverse
endif
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline+=%<                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*        " buffer number, and flags
set statusline+=%-40f                    " relative path
set statusline+=%{fugitive#statusline()} " git branch
set statusline+=%=                       " seperate between right- and left-aligned
set statusline+=%1*%y%*%*                " file type
set statusline+=%10((%l/%L)%)            " line and column
set statusline+=%P                       " percentage of file
