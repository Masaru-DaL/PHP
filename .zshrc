# モジュールの有効化
## color
autoload -Uz colors && colors
## tab補完
autoload -Uz compinit && compinit

export CLICOLOR=1

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

## suggestionsの色を変更
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

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
  echo "${user}%m@($(arch))${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%c ${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}-> ${reset}"
}

PROMPT=`left-prompt`

# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  branch='\ue0a0'
  color='%{\e[38;5;' #  文字色を設定
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset

  # if [ ! -e  ".git" ]; then
  if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# macOS 12 Monterey 以降ではデフォルトパス内に python コマンドが存在しないため、エイリアスを設定しないと git_super_status が機能しません。
alias python="python3"

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

# GoのPATHの追加
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$HOME/go/bin


if [ $SHLVL = 1 ]; then
    alias tmux="tmux attach || tmux new-session \; source-file ~/dotfiles/.tmux/session"
fi

#!/bin/zshrc

session_name="sesh"

# 1. First you check if a tmux session exists with a given name.
tmux has-session -t=$session_name 2> /dev/null

# 2. Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
  TMUX='' tmux new-session -d -s "$session_name"
fi

# 3. Attach if outside of tmux, switch if you're in tmux.
if [[ -z "$TMUX" ]]; then
  tmux attach -t "$session_name"
else
  tmux switch-client -t "$session_name"
fi
