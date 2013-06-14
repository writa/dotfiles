# prompt
case ${UID} in
 # root
 0)
  PROMPT='[%d]# '
   ;;
   # general
   *)
    PROMPT='[%d]$ '
    ;;
esac

# 色を使用出来るようにする
autoload -Uz colors
colors
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
	                    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# エイリアス
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g G='| grep'
alias -g L='| less'
alias -g V='| vim -R -'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
	# Mac
	alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
   	# Linux
	alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
	# Cygwin
        alias -g C='| putclip'
fi

# Go
export GOBIN=~/bin
export PATH=$PATH:/usr/local/go/bin:~/bin


# Git 
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
 
setopt prompt_subst
setopt re_match_pcre
 
function rprompt-git-current-branch {
local name st color gitdir action
if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
return
fi
name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
if [[ -z $name ]]; then
return
fi
gitdir=`git rev-parse --git-dir 2> /dev/null`
action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
														 
st=`git status 2> /dev/null`
if [[ "$st" =~ "(?m)^nothing to" ]]; then
color=%F{green}
elif [[ "$st" =~ "(?m)^nothing added" ]]; then
color=%F{yellow}
elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
color=%B%F{red}
else
color=%F{red}
fi
echo "$color$name$action%f%b"
}
RPROMPT='(`rprompt-git-current-branch`)'
