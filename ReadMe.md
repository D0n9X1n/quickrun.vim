quickrun.vim
---

[![GitHub version](https://badge.fury.io/gh/MikeCoder%2Fquickrun.vim.svg)](https://badge.fury.io/gh/MikeCoder%2Fquickrun.vim)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat)](https://mit-license.org/)

Yet, just another quickrun plugin for vim.

### Installation
Take Vundle as an example:

+ Add `Plugin 'MikeCoder/quickrun.vim'` to your vimrc file.
+ Then use `Vundle Install` to install this plugin.


### Config
In this plugin, the default run config has been set as following:
```
let g:quickrun_configs = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python %"],
    \}
```

These configuration means, when you edit a file with ".cpp". You will use `!g++ % && ./a.out` to run this file.

So, you can add your customize configuration here. If you want to use `:go test` command when you edit go files. You can add your config like this:

```
let g:quickrun_configs = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python %"],
        \"go": ["!go test"],
    \}
```

Here we use `%` to represent the file you currently edit.

This configuration you can write in your **vimrc file**.

### Usage
1. Auto detect the filetype.
> + When you editing your file, You can run `:QuickRun` to run your current file.
> + If you are editting *main.c* file, the command will be `:!gcc main.c && ./a.out`.

2. Run with spec filetype.
> + When you editing your file, you can run `:QuickRun go` to run your current file.
> + If you are editting *main.md*, the command will be `:!go test` to test the whole go project.

3. You can bind your key with `nnoremap <F5> :QuickRun<cr>` to enjoy the plugin.

### Optional

If you installed another plugin [asyncrun](https://github.com/skywind3000/asyncrun.vim), then you can also use `:QuickRunAsync` without changing any configs.

Notice that `:QuickRunAsync` will invode `:AsyncRun` for you, it is **only** used for system commands such as `!python foo.py`.

### License
See [@LICENSE](./LICENSE)


### TODO
See [@TODO.md](./TODO.md)
