# ~/.bashrc - managed via GNU Stow from config_files/bash

export EDITOR=vim
export VISUAL=code
export PAGER=less
export LESS='-FRX'

# Prefer local bin paths (uv, cargo, npm, etc.)
for dir in "$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/.npm-global/bin"; do
    [ -d "$dir" ] && case :$PATH: in *:$dir:*) ;; *) PATH="$dir:$PATH" ;; esac
done
export PATH

# Detect WSL to wire Windows interop helpers if desired
if grep -qi microsoft /proc/version 2>/dev/null; then
    export WSL_DISTRO_NAME="${WSL_DISTRO_NAME:-wsl}"
fi

# Load per-host overrides (drop *.bash files into ~/.bashrc.d)
if [ -d "$HOME/.bashrc.d" ]; then
    for snippet in "$HOME/.bashrc.d"/*.bash; do
        [ -r "$snippet" ] && source "$snippet"
    done
fi

alias ll='ls -alF'
alias la='ls -A'
alias gs='git status -sb'
alias k='kubectl'

# UV (modern Python packaging)
if command -v uv >/dev/null 2>&1; then
    export UV_NATIVE_TLS=1
    export UV_PYTHON_DOWNLOADS=prefer-cached
fi

# Prompt / theme selection -------------------------------------------------
# Prefer oh-my-bash if installed, fall back to starship, then a simple PS1.
if [ -d "$HOME/.oh-my-bash" ]; then
    export OSH="$HOME/.oh-my-bash"
    : "${OSH_THEME:=powerline}"
    source "$OSH/oh-my-bash.sh"
elif command -v starship >/dev/null 2>&1; then
    export STARSHIP_CONFIG="$HOME/.config/starship.toml"
    eval "$(starship init bash)"
else
    PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\]$ '
fi
