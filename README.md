<p align="center">  
<a href="https://github.com/ohmyzsh/ohmyzsh/">Oh My Zsh</a> plugin for <a href="//github.com/xxh/xxh-shell-zsh">xxh-shell-zsh</a>.
</p>

<p align="center">  
If you like the idea of xxh click ⭐ on the repo and stay tuned.
</p>


## Install
This fork's changes are not in the xxh repo, so install it from GitHub:
```
xxh +I https://github.com/jcaraban/xxh-plugin-zsh-ohmyzsh
```
Connect:
``` 
xxh yourhost +s zsh +if
```
`+if` reinstalls the plugin on the host; use it once after updating the plugin.

## What this fork adds
* Sources the host's `~/.profile` (once per session), since xxh's zsh reads none of the host's startup files: PATH and environment set there are available.
* `zsh-completions` definitions are on `fpath` before oh-my-zsh runs `compinit`.
* `zsh-syntax-highlighting` is always loaded last, as it requires.
* Home/End work with both `^[[1~`/`^[[4~` and xterm's `^[[H`/`^[[F`.

## Seamless mode
To use seamless mode with saving your theme and plugins use `source` command: 
```
source xxh.zsh myhost
```

## Environment variables

Xxh support environment variables: `xxh myhost +e NAME=VAL` or `~/.config/xxh/config.xxhc` (`$XDG_CONFIG_HOME`) config.

* `+e ZSH_THEME=clean` - set theme
* `+e plugins="(git ubuntu)"` - set plugins list
