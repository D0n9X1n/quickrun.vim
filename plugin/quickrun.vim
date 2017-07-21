"""""""""""""""""""""""
" quickrun.vim
" version: v0.0.1
" author: Dongxin Tang
" mail: mike@mikecoder.cn
"""""""""""""""""""""""

let g:quickrun_known_file_types = {
            \"cpp": "g++",
            \"c": "g++",
            \"php": "php",
            \"py": "python",
    \}

let s:SourcedFile = expand("<sfile>")

function! QuickRun()
    echo s:SourcedFile
    let file_type = split(s:SourcedFile, "\\.")[-1]
    echo file_type

    if not empty(file_type)
        if has_key(g:quickrun_known_file_types, file_type)

        endif
    endif
endfunction


if !exists(':QuickRun')
    command -nargs=0 QuickRun :call QuickRun()
endif

if !exists(':QuickRunWithType')
    command -nargs=1 QuickRunWithType :call QuickRunWithType(<f-args>)
endif
