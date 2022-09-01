# NeoVim 配置

我的 `NeoVim` 配置

- **NeoVim 项目**：https://github.com/neovim/neovim
- **NeoVim 官网**：https://neovim.io/

**其它类 vi 软件**
- LunarVim: https://github.com/LunarVim/LunarVim **(配置)**
  > https://www.lunarvim.org
- SpaceVim: https://github.com/SpaceVim/SpaceVim **(配置)**
  > https://spacevim.org 

## 前置条件
> **已安装**：`curl,git`

## 安装
```bash
# 国内
curl -fsL https://jihulab.com/jetsung/nvim/raw/main/install.sh | bash

# 国外
curl -fsL https://github.com/jetsung/nvim/raw/main/install.sh | bash
```

## Vim 安装
- **官方教程**：https://github.com/neovim/neovim/wiki/Installing-Neovim
  ```bash
  # Linux
  ## Debian 系
  apt install neovim
  ## RHEL 系
  dnf install -y neovim python3-neovim

  # MacOS
  brew reinstall neovim
  ```

## 基础设置
- 基础配置文件
  ```bash
  $HOME/.config/nvim/init.vim
  ```

- **设置 `vi` 为 `nvim` 的别名**   
将下述配置添加至 `~/.zshrc` 或 `~/.bashrc`
  ```bash
  ## NeoVim
  alias vi=nvim
  ```

## 插件设置
- **插件市场**：https://vimawesome.com/

### vim-plug
- 插件管理器地址：https://github.com/junegunn/vim-plug   
 
**安装**
```bash
# 中国镜像
export GH=https://ghproxy.com/

# 安装
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       ${GH}https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
