quickrun.vim
---

[![GitHub version](https://badge.fury.io/gh/MikeCoder%2Fquickrun.vim.svg)](https://badge.fury.io/gh/MikeCoder%2Fquickrun.vim)

Yet, just another quickrun plugin for vim.

### Installation
Take Vundle as an example:

+ Add `Plugin 'MikeCoder/quickrun.vim'` to your vimrc file.
+ Then use `Vundle Install` to install this plugin.


### Config
In this plugin, the default run config has been set as following:
```
let g:quickrun_known_file_types = {
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
let g:quickrun_known_file_types = {
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

### License
See [@LICENSE](./LICENSE)


### TODO
See [@TODO.md](./TODO.md)
