# vim-plug

- https://github.com/junegunn/vim-plug

## 安装
```bash
# 中国镜像
export GH=https://ghproxy.com/

# 安装
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       ${GH}https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 插件更新说明
> 修改相关配置，然后执行 `./install.sh -i` 更新即可

### 插件
|分类|插件名|描述|
|:---|:---|:---|
|**编程语言** | | |
| |[rust-lang/rust.vim](https://github.com/rust-lang/rust.vim) | Rust 语言支持 |
| |[fatih/vim-go](https://github.com/fatih/vim-go) | Go 语言支持 |
|**编程器扩展**| | |
| |[z0mbix/vim-shfmt](https://github.com/z0mbix/vim-shfmt) | Shell 内容格式化|
| |[editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) | EditorConfig 插件 |
| |[mhinz/vim-startify]() | 最近使用文件 |

### [CoC 插件](https://github.com/neoclide/coc.nvim)
> :CocInstall coc-rust-analyzer

|插件名|描述|
|:---|:---|
|[coc-rust-analyzer](https://github.com/fannheyward/coc-rust-analyzer)| |