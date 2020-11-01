" Tabularize mappings
" "
" "   sa= -- align by equals
" "   sa> -- align by "=>"
" "
" " and so on. Note that any character can be entered and the mappings will
" " attempt to align by that, in the simplest way possible.
" "
" "   sa| -- equivalent to ":Tab/|"
" "
" " The custom Tabularize definitions need to be placed in
" " after/plugin/tabularize.vim, so that they can be defined after the plugin
" is
" " loaded.
nnoremap sa      :call <SID>TabularizeMapping(0)<cr>
xnoremap sa :<c-u>call <SID>TabularizeMapping(1)<cr>
function! s:TabularizeMapping(visual)
        echohl ModeMsg | echo "-- ALIGN -- "  | echohl None
        let align_type = nr2char(getchar())
        if align_type     == '='
                call s:Tabularize('equals', a:visual)
        elseif align_type == '>'
                call s:Tabularize('ruby_hash', a:visual)
        elseif align_type == ','
                call s:Tabularize('commas', a:visual)
        elseif align_type == ':'
                call s:Tabularize('colons', a:visual)
        elseif align_type == ' '
                call s:Tabularize('space', a:visual)
        else " just try aligning by the character
                call s:Tabularize('/'.align_type, a:visual)
        end
endfunction
function! s:Tabularize(command, visual)
        normal! mz

        let cmd = "Tabularize ".a:command
        if a:visual
                let cmd = "'<,'>" . cmd
        endif
        exec cmd
        echo

        normal! `z
endfunction

" Tabularize "reset" -- removes all duplicate whitespace. Very useful when a
" single item is left after tabularizing and editing afterwards.
nnoremap s= :call <SID>TabularizeReset()<cr>
xnoremap s= :call <SID>TabularizeReset()<cr>
function!  s:TabularizeReset()
        let original_cursor = getpos('.')

        s/\S\zs \+/ /g

        " Don't leave an entry in the history
        call histdel('search', -1)
        let @/ = histget('search', -1)

        call setpos('.', original_cursor)
endfunction"

AddTabularPattern! equals       /^[^=]*\zs=/
AddTabularPattern! ruby_hash    /^[^=>]*\zs=>/
AddTabularPattern! commas       /,\s*\zs\s/l0
AddTabularPattern! colons       /^[^:]*:\s*\zs\s/l0

" Not perfect, causes problems sometimes
AddTabularPipeline space / \+/
      \ map(a:lines, "substitute(v:val, ' \+', ' ', 'g')")
      \   | tabular#TabularizeStrings(a:lines, ' ', 'l0')
