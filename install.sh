#!/usr/bin/env bash

# Load var
load_var() {
    PRO_URL="https://jihulab.com/jetsung/nvim.git"
    PLUG_FILE="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
}

# Get OS
get_os() {
    OS=$(uname | tr '[:upper:]' '[:lower:]')
    case $OS in
        darwin) OS='darwin';;
        linux) OS='linux';;
        *) printf "\e[1;31mOS %s is not supported by this installation script\e[0m\n" ${OS}; exit 1;;
    esac
}

# Get package name
get_pkg_name() {
    local PKG_LIST="brew apt dnf"
    for PKG in ${PKG_LIST}; do
        if chkcmd ${PKG} ; then
            echo "${PKG}"
            return
        fi
    done
}

# Check in China
check_in_china() {
    urlstatus=$(curl -s -m 2 -IL https://google.com | grep 200)
    [[ -z "${urlstatus}" ]] && IN_CHINA="Yes"
    # unset IN_CHINA
    # echo $IN_CHINA
}


chkcmd() {
    command -v "$@" > /dev/null 2>&1
}

# Install NeoVim
install_neovim() {
    PKG_NAME=$(get_pkg_name)

    if ! chkcmd "nvim" ; then 
        if [[ "${PKG_NAME}" = "brew" ]]; then
            ${PKG_NAME} install nvim gsed
        else
            if [[ $(id -u) -eq 0 ]]; then
                ${PKG_NAME} install nvim
            else
                sudo ${PKG_NAME} install nvim
            fi
        fi
    fi
}

# Online install nvim
online_install()  {
    check_in_china
    plug_install

    local TMP_FOLDER="/tmp/nvim"
    [[ -d "${TMP_FOLDER}" ]] && rm -rf "${TMP_FOLDER}"

    echo "Online install"
    [[ -z "${IN_CHINA}" ]] && PRO_URL=${PRO_URL//jihulab//github}
    git clone "${PRO_URL}" "${TMP_FOLDER}"

    cd "${TMP_FOLDER}"
    ./install.sh -i
}

plug_install() {
    if [[ ! -f "${PLUG_FILE}" ]]; then
        [[ -z "${IN_CHINA}" ]] || GH="https://ghproxy.com/"
        curl -fsLo "${PLUG_FILE}" --create-dirs "${GH}https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    fi
}

sedi() {
    if [[ "${OS}" = "darwin" ]]; then
        gsed "$@"
    else
        sed "$@"
    fi
}

# Set plugins
set_plugins() {
    if [[ "${OS}" = "darwin" ]]; then
        chkcmd "gsed" || brew install gsed
    fi

    local NVIM_CONF="${HOME}/.config/nvim/init.vim"
    if [[ ! -f "${NVIM_CONF}" ]]; then
        local TMP_F1="${NVIM_CONF%/*}"
        [[ -d "${TMP_F1}" ]] || mkdir -p "${TMP_F1}"
        cp ./init.vim "${TMP_F1}"
    fi

    local GIT_PLUGIN="./plugin/plugin.vim"
    local GIT_PLUGCFG="./plugin/plugcfg.vim"
    local PLUGIN_HAS=$(grep 'call plug#begin' "${NVIM_CONF}")
    local UPDATED
    if [[ -z "${PLUGIN_HAS}" ]]; then
        cat "${GIT_PLUGIN}" >> "${NVIM_CONF}"
        cat "${GIT_PLUGCFG}" >> "${NVIM_CONF}"
    else
        install_plugins
    fi

    update_plugcfg
    
    [[ -z "${UPDATED}" ]] || nvim +PlugInstall
}

# install plugins
install_plugins() {
    local NUM=1
    IFS=$'\n'
    for PLUG in $(cat "${GIT_PLUGIN}" | grep "Plug "); do
        local PLUGIN=$(echo "${PLUG}" | cut -d "'" -f2)
        local PLUGIN_EXIST=$(grep "${PLUGIN}" "${NVIM_CONF}")

        if [[ -z "${PLUGIN_EXIST}" ]]; then
            local LINE_END=$(cat "${NVIM_CONF}" | grep -n 'call plug#end()' | cut -d ':' -f1)
            # 在 call plug#end() 前追加内容
            printf "Add Plugin ${NUM}: %s\n" "${PLUGIN}"
            sedi -i "${LINE_END} i${PLUG}" "${NVIM_CONF}"

            NUM=`expr ${NUM} + 1`
            UPDATED="Yes"
        fi
    done
}

# update plugin config
update_plugcfg() {
    # 按行截取
    IFS=$'\n'
    for CFG in $(cat "${GIT_PLUGCFG}"); do
        # 不以 " 开头
        if ! [[ "${CFG}" =~ ^\".* ]]; then
            local PLUGCFG_KEY=$(echo "${CFG}" | cut -d "=" -f1)
            local PLUGCFG_EXIST=$(grep "${PLUGCFG_KEY}" "${NVIM_CONF}")
            if [[ -z "${PLUGCFG_EXIST}" ]]; then
                echo "${CFG}" >> "${NVIM_CONF}"
            else
                sedi -i "s@^${PLUGCFG_KEY}.*@${CFG}@" "${NVIM_CONF}"
            fi
        fi
    done
}

# Show help
show_help() {
    printf "${0}

Options:

  -i           : Install vim-plug
  -r           : Reinstall vim-plug and update plugins
  -h | --help  : Help
\n"
}

main() {
    get_os
    load_var

    if [[ $# -eq 0 ]]; then
        online_install
        exit
    fi

    install_neovim

    case "${1}" in
        -i | init | -r | reinstall)
            plug_install

            # 重装
            if [[ "${1}" = "-r" || "${1}" = "reinstall" ]]; then
                local NVIM_CONF="${HOME}/.config/nvim/"
                [[ -d "${NVIM_CONF}" ]] && rm -rf "${NVIM_CONF}"
                [[ -f "${PLUG_FILE}" ]] && rm -rf "${PLUG_FILE}"

                check_in_china
                plug_install
            fi

            # 更新项目文件
            if [[ "${2}" = "-u" || "${2}" = "upgrade" ]]; then
                git pull origin main
            fi

            set_plugins
        ;;

        -h | --help)
            show_help
        ;;
    esac
}

main "$@"