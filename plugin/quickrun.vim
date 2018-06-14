"""""""""""""""""""""""
" quickrun.vim
" version: v0.0.3
" author: Dongxin Tang
" mail: mike@mikecoder.cn
"""""""""""""""""""""""

if !exists('g:quickrun_known_file_types')
    let g:quickrun_known_file_types = {
                \"cpp": ["!g++ -g \"%\"", "lldb ./a.out"],
                \"c": ["!g++ -g \"%\"", "./a.out"],
                \"php": ["!php \"%\""],
                \"vim": ["source \"%\""],
                \"py": ["!python \"%\""],
                \"git": ["!git add.", "git commit -am '%'", "git push origin master"],
                \"md": ["MarkdownPreview github"],
            \}
endif

function! QuickRun()
    let file_type = expand("%:e")
    " echo file_type
    if has_key(g:quickrun_known_file_types, file_type)
        let qr_command = join(g:quickrun_known_file_types[file_type], '&&')
        execute qr_command
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
