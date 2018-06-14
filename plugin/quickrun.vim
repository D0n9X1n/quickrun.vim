"""""""""""""""""""""""
" quickrun.vim
" version: v0.0.3
" author: Dongxin Tang
" mail: mike@mikecoder.cn
"""""""""""""""""""""""

if !exists("g:quickrun_configs")
    let g:quickrun_configs = {
                \ "cpp": ["!g++ -g \"%\"", "lldb ./a.out"],
                \ "c": ["!g++ -g \"%\"", "./a.out"],
                \ "php": ["!php \"%\""],
                \ "vim": ["source \"%\""],
                \ "py": ["!python \"%\""],
                \ "git": ["!git add.", "git commit -am "%"", "git push origin master"],
                \ "md": ["MarkdownPreview github"],
                \ "tex": ["!latexmk -pvc \"%\""]
                \ }
endif

function! s:GetQuickRunCommand(async, ...)
    if a:0 < 1
        let file_type = expand("%:e")
    else
        let file_type = a:1
    endif
    if has_key(g:quickrun_configs, file_type)
        let qr_command =  join(g:quickrun_configs[file_type], "&&")
        if a:async && qr_command[0] == "!"
            return qr_command[1:]
        else
            return qr_command
        endif
    endif
endfunction

if !exists(":QuickRun")
    command -nargs=? QuickRun execute s:GetQuickRunCommand(0, <f-args>)
endif

if !exists(":QuickRunAsync") && exists(":AsyncRun")
    command -nargs=? QuickRunAsync execute ':AsyncRun ' . s:GetQuickRunCommand(1, <f-args>)
endif
