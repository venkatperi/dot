#autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%F{red}●%F{green}]'
    }

    node_version="N$(node --version | cut -d'v' -f2)"
    #node_version="N$(node --version | cut -d'v' -f2)|P$(python -V | cut -d' ' -f2)"
    #|R$(ruby --version | cut -d' ' -f2 | cut -d'p' -f1)|G$(go version | cut -d' ' -f3 | cut -d'o' -f2)"
    vcs_info
}

node_version=$(node --version)
setopt prompt_subst
PROMPT='%F{yellow}%m:%F{green}${node_version}:%F{magenta}%c%F{green}${vcs_info_msg_0_}%F{magenta} %F{white}$ %F{grey%}'
RPROMPT="%D{%f/%m/%y} %D{%L:%M:%S}"

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

echo -ne "\033]0;$(hostname)\007"
