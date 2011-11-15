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
:map <C-d> :execute 'NERDTree '<CR>
" Number lines on/off    
map <F2> :set number!<CR>
map! <F2> <ESC><F2> i

" Make trailing space visible  
map <F4> :set hls<CR>/\s\+$<CR>
map! <F4> <ESC><F4>i"

" Highlight on/off
map <F7> :set hls!<CR><Bar>:echo "HLSearch: " . strpart("OffOn", 3 * &hlsearch, 3)<CR>
map! <F7> <ESC><F7>i"

" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
