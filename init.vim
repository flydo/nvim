" ************************************************* Basic Setting 


" ====================================== 
" 基础配置 
" ====================================== 
"  syntax on " 打开语法高亮  
"  filetype indent on " 开启文件类型检查，并且载入与该类型对应的缩进规则 
set cursorline   " 高亮当前行 
set ruler        " 显示当前位置 
set showcmd      " 在命令模式下显示当前命令 
set showmode     " 在底部状态栏显示当前模式，如插入、命令模式 
set nocompatible " 不兼容vi命令 
set mouse=a      " 支持鼠标 
set laststatus=2 " 是否显示状态栏。0表示不显示，1表示只在多窗口时显示，2表示显示 

" 当前文本使用uf8编码, 解决中文乱码 "
set encoding=utf-8 " 使用 UTF-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set number " 显示行号 
set wrap             " 自动折行，即太长的行分成几行显示，关闭自动折行为 set nowrap 
set linebreak        " 只有遇到指定的符号（比如空格、连词号和其他标点符号），发生折行。也就是说，不会在单词内部折行 
set history=1000     " 保留命令的历史记录数 
set textwidth=100    " 设置行宽，即一行显示多少个字符 
set scrolloff=5      " 垂直滚动时，光标距离顶部/底部的位置（单位：行） 
set sidescrolloff=10 " 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用 

" ====================================== 
" 缩进相关配置 
" ====================================== 
set expandtab     " 缩进时将 Tab 制表符转为空格 
set autoindent    " 自动缩进 
set shiftwidth=4  " 设置自动缩进宽度为 4 
set tabstop=4     " 设置 Tab 制表符所占宽度为 4 
set softtabstop=4 " 设置按 Tab 时缩进宽度为 4 


" ====================================== "
" 搜索相关配置 "
" ====================================== "
set hlsearch   " 搜索结果高亮 
set showmatch  " 光标遇到 {[()]} 时，会高亮显示另一半匹配的符号 
set incsearch  " 实时开启搜索高亮 
set smartcase  " 设置智能大小写 
set ignorecase " 设置忽略大小写 

" ====================================== "
" 编辑相关配置 "
" ====================================== "
set noswapfile   " 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是 . ，结尾是 .swp 
set wildmenu     " 命令模式下，底部操作指令按下 Tab 键自动补全 
set autoread     " 打开文件监视。如果在编辑过程中文件发生外部改变，就会发出提示 
set autochdir    " 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录 
set visualbell   " 出错时，发出视觉提示，通常是屏幕闪烁 
set noerrorbells " 出错时，不要发出响声 
set clipboard=unnamedplus      " 开启系统剪切板
set backspace=indent,eol,start " 退格键可以删除 

" ====================================== "
" 定制相关配置 "
" ====================================== "
inoremap jk <ESC> " Esc 快捷键 (插入模式下 jk 替换 Esc )

" ************************************************* End Setting "
