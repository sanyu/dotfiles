"The first time run
"git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/bundle/vundle
"vim -u ~/dotfiles/bundles.vim +BundleInstall +q
"

source ~/dotfiles/bundles.vim
syntax on
set hlsearch
set incsearch
set number
set cursorline
set ruler
set ai
set si
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set rtp+=/usr/local/opt/fzf

runtime! macros/matchit.vi
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

let g:ackprg = 'ag --vimgrep --smart-case'                                                   
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
let g:ragtag_global_maps = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1

let g:fugitive_gitlab_domains = [ 'https://git.papt.to', 'https://gitlab.belus.apptio.lan' ]
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" first, enable status line always
set laststatus=2
set noshowmode
set encoding=utf-8
"
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" set statusline+=%<                              " cut at start
" set statusline+=%2*[%n%H%M%R%W]%*               " buffer number, and flags
" set statusline+=%-40f                           " relative path
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
" set statusline+=%{&ff}]                         " file format
" set statusline+=[Filetype=%Y]                   " file type
" set statusline+=\ %{fugitive#statusline()}      " git branch
" "display a warning if &paste is set
" set statusline+=%#error#
" set statusline+=%{&paste?'[paste]':''}
" set statusline+=%*
" " set statusline+=%1*%y%*%*                     	" file type
" set statusline+=%=                              	" seperate between right- and left-aligned
" set statusline+=%#warningmsg#                   	" Syntastic
" set statusline+=%{SyntasticStatuslineFlag()}    	" Syntastic
" set statusline+=%*                              	" Syntastic
" set statusline+=%{StatuslineCurrentHighlight()}\ \ 	" current highlight
" set statusline+=%c,     				" cursor column
" set statusline+=%1((%l/%L)%)                   	" line and total lines
" set statusline+=%P                              	" percentage of file

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

function! InitializeDirectories()
    let separator = "." 
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = { 
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/" 
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
