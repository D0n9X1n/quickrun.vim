"""""""""""""""""""""""
" quickrun.vim
" version: v0.0.1
" author: Dongxin Tang
" mail: mike@mikecoder.cn
"""""""""""""""""""""""

if !exists('g:quickrun_known_file_types')
    let g:quickrun_known_file_types = {
                \"cpp": ["!g++ %", "./a.out"],
                \"c": ["!g++ %", "./a.out"],
                \"php": ["!php %"],
                \"vim": ["source %"],
                \"py": ["!python %"],
                \}
endif

function! QuickRun()
    let current_file = expand("%")

    if !empty(current_file)
        let file_types = split(current_file, "\\.")
        if len(file_types) > 1
            let file_type = file_types[-1]
            " echo file_type
            if has_key(g:quickrun_known_file_types, file_type)
                let qr_command = join(g:quickrun_known_file_types[file_type], '&&')
                execute qr_command
            endif
        endif
    endif
endfunction

function! QuickRunWithType(args1)
    let file_type = a:args1
    " echo file_type
    if has_key(g:quickrun_known_file_types, file_type)
        let qr_command = join(g:quickrun_known_file_types[file_type], '&&')
        execute qr_command
    endif
endfunction

if !exists(':QuickRun')
    command -nargs=0 QuickRun :call QuickRun()
endif

if !exists(':QuickRunWithType')
    command -nargs=1 QuickRunWithType :call QuickRunWithType(<f-args>)
endif
