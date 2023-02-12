# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/sidparmar/.oh-my-zsh"

# Pyenv:
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Set TERM to allow colored lightline:
export TERM=xterm-256color

# set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $random_theme
# see https://github.com/ohmyzsh/ohmyzsh/wiki/themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# set list of themes to pick from when loading at random
# setting this variable when zsh_theme=random will cause zsh to load
# a theme from this variable instead of looking in $zsh/themes/
# if set to an empty array, this variable will have no effect.
# zsh_theme_random_candidates=( "robbyrussell" "agnoster" )

# uncomment the following line to use case-sensitive completion.
# case_sensitive="true"

# uncomment the following line to use hyphen-insensitive completion.
# case-sensitive completion must be off. _ and - will be interchangeable.
# hyphen_insensitive="true"

# uncomment the following line to disable bi-weekly auto-update checks.
# disable_auto_update="true"

# uncomment the following line to automatically update without prompting.
# disable_update_prompt="true"

# uncomment the following line to change how often to auto-update (in days).
# export update_zsh_days=13

# uncomment the following line if pasting urls and other text is messed up.
# disable_magic_functions="true"

# uncomment the following line to disable colors in ls.
# disable_ls_colors="true"

# uncomment the following line to disable auto-setting terminal title.
# disable_auto_title="true"

# uncomment the following line to enable command auto-correction.
# enable_correction="true"

# uncomment the following line to display red dots whilst waiting for completion.
# completion_waiting_dots="true"

# uncomment the following line if you want to disable marking untracked files
# under vcs as dirty. this makes repository status check for large repositories
# much, much faster.
# disable_untracked_files_dirty="true"

# uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# you can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# hist_stamps="mm/dd/yyyy"

# would you like to use another custom folder than $zsh/custom?
# zsh_custom=/path/to/new-custom-folder

# which plugins would you like to load?
# standard plugins can be found in $zsh/plugins/
# custom plugins may be added to $zsh_custom/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
# add wisely, as too many plugins slow down shell startup.
plugins=(git pyenv macos zsh-autosuggestions colored-man-pages python pip zsh-syntax-highlighting thefuck)

source $ZSH/oh-my-zsh.sh

# user configuration

# export manpath="/usr/local/man:$manpath"

# you may need to manually set your language environment
# export lang=en_us.utf-8

# preferred editor for local and remote sessions
# if [[ -n $ssh_connection ]]; then
#   export editor='vim'
# else
#   export editor='mvim'
# fi

# compilation flags
# export archflags="-arch x86_64"

# set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the zsh_custom folder.
# for a full list of active aliases, run `alias`.
#
# example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export nvm_dir="$home/.nvm"
[ -s "$nvm_dir/nvm.sh" ] && \. "$nvm_dir/nvm.sh"  # this loads nvm
[ -s "$nvm_dir/bash_completion" ] && \. "$nvm_dir/bash_completion"  # this loads nvm bash_completion


source ~/.nvm/nvm.sh
source "/users/sidparmar/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Adds SML to the path
export PATH=/usr/local/smlnj/bin:"$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
