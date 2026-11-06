CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
plugin_name='xxh-plugin-zsh-ohmyzsh'

# xxh's zsh reads no startup files of the host, so PATH and env from ~/.profile would be missing.
# Once per session: nested shells inherit the environment and would only duplicate PATH entries.
if [[ -z $XXH_PROFILE_LOADED && -r "$HOME/.profile" ]]; then
  export XXH_PROFILE_LOADED=1
  emulate sh -c '. "$HOME/.profile"'
fi

export ZSH="$CURR_DIR/ohmyzsh"

if [[ -v ZSH_THEME ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Found ZSH_THEME=$ZSH_THEME
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Set default ZSH_THEME=agnoster
  fi
  export ZSH_THEME="agnoster"
fi

if [[ -v plugins ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Found plugins=$plugins
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Set default plugins=git
  fi
  export plugins=(git)
fi

# oh-my-zsh runs compinit once; completion dirs added later by plugins would be ignored.
fpath+=("$ZSH/custom/plugins/zsh-completions/src")

export DISABLE_AUTO_UPDATE=true
source $CURR_DIR/ohmyzsh/oh-my-zsh.sh

export ZSH_THEME_TERM_TAB_TITLE_IDLE="%m:%~"
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
