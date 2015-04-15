# Created by newuser for 5.0.6
#

#alias を共通化する
source ~/.bashrc

# 右プロンプトは最後の行のみ表示させる
setopt transient_rprompt

autoload -Uz zmv


# from http://0xcc.net/blog/archives/000032.html
# パス名の短縮表示機能がある
case "$TERM" in
    xterm*|kterm*|rxvt*)
    PROMPT=$(print "%B%{\e[34m%}%m:%(5~,%-2~/.../%2~,%~)%{\e[33m%}%# %b")
    PROMPT=$(print "%{\e]2;%n@%m: %~\7%}$PROMPT") # title bar
    ;;
    *)
    PROMPT='%m:%c%# '
    ;;
esac



# from http://d.hatena.ne.jp/NeoCat/20120822/1345657535
#右プロンプト
# %F{～}は色指定、%fでリセット
# %nはログインユーザ名、%~はカレントディレクトリ
# "%(?..%F{red}-%?-)" は終了コードが0以外なら赤色で表示
# "%1(v|%F{yellow}%1v%F{green} |)" の部分がVCS情報 (psvarの長さが1以上なら黄色で表示)
#RPROMPT="%(?..%F{red}-%?-)%F{green}[%1(v|%F{yellow}%1v%F{green} |)%n:%~]%f"
#RPROMPT="%(?..%F{red}-%?-)%F{green}[%1(v|%F{yellow}%1v%F{green} |)]%f"
#
##gitブランチ名表示
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:git:*' formats '%c%u%b'
#zstyle ':vcs_info:git:*' actionformats '%c%u%b|%a'
#
##カレントディレクトリ/コマンド記録
#local _cmd=''
#local _lastdir=''
#preexec() {
#  _cmd="$1"
#  _lastdir="$PWD"
#}
##git情報更新
#update_vcs_info() {
#  psvar=()
#  LANG=en_US.UTF-8 vcs_info
#  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
##カレントディレクトリ変更時/git関連コマンド実行時に情報更新
#precmd() {
#  _r=$?
#  case "${_cmd}" in
#    git*|stg*) update_vcs_info ;;
#    *) [ "${_lastdir}" != "$PWD" ] && update_vcs_info ;;
#  esac
#  return $_r
#}




# from http://kitak.hatenablog.jp/entry/2013/05/25/103059
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"



