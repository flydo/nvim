" ************************************************* Plugin Setting 
call plug#begin()

Plug 'mattn/webapi-vim'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' " 目录树 
Plug 'mhinz/vim-startify' " 最近使用文件列表

" 主题
"  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim', { 'tag': 'v1.0.0' } 

" 编程语言 
Plug 'rust-lang/rust.vim' " Rust
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go

" 编程语言相关 
Plug 'dense-analysis/ale' " 语法检查 
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' } " shell 代码格式化 
Plug 'editorconfig/editorconfig-vim', { 'branch': 'master' } " EditorConfig 插件
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 语法提示

call plug#end()
" ************************************************* End Setting 
