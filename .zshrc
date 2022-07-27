# モジュールの有効化
## color
autoload -Uz colors && colors
## tab補完
autoload -Uz compinit && compinit

# pathの追加
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

# completions / autosuggestions
 if type brew &>/dev/null; then
   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
   source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
   autoload -Uz compinit && compinit
 fi

# 空行を追加するようにする
add_newline() {
  if [[ -z $PS1_NEWLINE_LOGIN ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
precmd() { add_newline }

# zsh-git-prompt
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh

function left-prompt {
  name_t='075m%}'      # user name text clolr
  name_b='237m%}'    # user name background color
  path_t='191m%}'     # path text clolr
  path_b='026m%}'   # path background color
  arrow='087m%}'   # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp='\uE0B0'      # triangle

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%m@($(arch))${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset} $(git_super_status)\n${text_color}${arrow}→ ${reset}"
}

PROMPT=`left-prompt`
# prompt
# PROMPT='%F{075}%n%f %F{103}($(arch))%f:%F{220}%~%f $(git_super_status)'
# PROMPT+=""$'\n'"%# "

# macOS 12 Monterey 以降ではデフォルトパス内に python コマンドが存在しないため、エイリアスを設定しないと git_super_status が機能しません。
alias python="python3"

# Iceberg
export CLICOLOR=1

# インストールしたコマンドを即認識させる
zstyle ":completion:*:commands" rehash 2

# alias
## ls
alias ls="ls -FG"
alias ll="ls -al"

## cd -> ls(HOMEじゃない場合)
chpwd() {
	if [[ $(pwd) != $HOME ]]; then;
		ls
	fi
}

# enchancd
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

export TERM=xterm-256color

# #スライム
TEXTDIR=~/DQ/text
NUM=$(($RANDOM % 100))
#スライム 40%の確率 (RANGE: 0-39)
if [ $NUM -lt 40 ]; then
  sed -e 's/^/\t/g' $TEXTDIR/slime.txt
  [ $PROMPT = "ON" ] &&  prompt "スライム" "\t\t\t" 
#ベス 25%の確率 (RANGE: 40-64)
elif [ $NUM -lt 65 ]; then      
  sed -e 's/^/\t/g' $TEXTDIR/slime-beth.txt
  [ $PROMPT = "ON" ] &&  prompt "スライムベス" "\t\t\t" 
#バブル 20%の確率 (RANGE: 65-84)
elif [ $NUM -lt 85 ]; then
  cat $TEXTDIR/bubble-slime.txt
  [ $PROMPT = "ON" ] &&  prompt "バブルスライム" "\t\t" 
#メタル 10%の確率 (RANGE: 85-94)
elif [ $NUM -lt 95 ]; then
  sed -e 's/^/\t/g' $TEXTDIR/metal-slime.txt
  [ $PROMPT = "ON" ] &&  prompt "メタルスライム" "\t\t" 
#はぐれ 4%の確率 (RANGE: 95-98)
elif [ $NUM -lt 99 ]; then
  cat $TEXTDIR/hagure-metal.txt
  [ $PROMPT = "ON" ] &&  prompt "はぐれメタル" "\t\t\t" 
#3種盛り 1%の確率 (RANGE: 99)
elif [ $NUM -eq 99 ]; then
  cat $TEXTDIR/slime-allstar.txt
  [ $PROMPT = "ON" ] &&  prompt "allstar"
fi

# Settings for fzf
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
