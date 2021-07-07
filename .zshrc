# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Autocomplete for Teamocil
compctl -g '~/.teamocil/*(:t:r)' teamocil

#Autocomplete for SSH
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bower npm osx sublime)

# User configuration
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# export MANPATH="/usr/local/man:$MANPATH"

# Different prompt color for root
autoload colors
colors
PS1="%~ %{%(#~$fg[red]~$fg[blue])%}%#%{$fg[default]%} "

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Fix for WebStorm issue with Keyboard Input
# https://youtrack.jetbrains.com/issue/IDEA-78860
export IBUS_ENABLE_SYNC_MODE=1

# alias tmuxks="tmux kill-session"
# alias tmuxkr="tmux kill-server"
# alias mvni="mvn clean install -Dmaven.test.skip -Plocal"
# alias mvn-update="mvn appengine:update -Pdevelopment -Dmaven.test.skip"
alias yc='yarn upgrade-interactive --latest'
alias ys='yarn serve'
alias ya='yarn api'
alias yb='yarn build:prod'
alias ysm='yarn serve:mock'
alias ycd='yarn check:deps'
alias yt='yarn test:dev || yarn test'
alias yclean='rm -rf node_modules/ && rm yarn.lock && yarn'
alias analyze='source-map-explorer "build/static/js/*.js"'

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"


[ -s "/home/yhnavein/.dnx/dnvm/dnvm.sh" ] && . "/home/yhnavein/.dnx/dnvm/dnvm.sh" # Load dnvm
