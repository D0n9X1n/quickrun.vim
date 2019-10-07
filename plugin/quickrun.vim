"""""""""""""""""""""""
" quickrun.vim
" author: Dongxin Tang
" mail: mike@mikecoder.cn
"""""""""""""""""""""""

if !exists('g:quickrun_config_file_name')
    let g:quickrun_config_file_name = ".quickrun"
endif

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

if !(has('python') || has('python3'))
    echo 'Error: Required vim compile with +python or +python3'
    finish
endif

if has('python')
    let g:isPython3 = 0
endif

" we are prefer to use python3
if has('python3')
    let g:isPython3 = 1
endif

function! HasConfigFile(arg1)
    let g:hasConfigFile = 0
    if g:isPython3
python3 << EOF
import quickrun
import vim
quickrun.findConfigFile(vim.eval("a:arg1"))
EOF
    else
python << EOF
import quickrun
import vim
quickrun.findConfigFile(vim.eval("a:arg1"))
EOF
    endif
endfunction

function! QuickRunWithConfigFile(arg1)
    if g:isPython3
python3 << EOF
import quickrun
import vim
quickrun.runWithConfigFile(vim.eval("a:arg1"))
EOF
    else
python << EOF
import quickrun
import vim
quickrun.runWithConfigFile(vim.eval("a:arg1"))
EOF
    endif
endfunction

function! QuickRunByDefault()
    let file_type = expand("%:e")
    if has_key(g:quickrun_known_file_types, file_type)
        let qr_command = join(g:quickrun_known_file_types[file_type], '&&')
        execute qr_command
    endif
endfunction

function! QuickRun()
    " try to find config file first
    call HasConfigFile(g:quickrun_config_file_name)

    if g:hasConfigFile
        call QuickRunWithConfigFile(g:quickrun_config_file_name)
    else
        call QuickRunByDefault()
    endif
endfunction

function! QuickRunWithType(args1)
    let file_type = a:args1
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
