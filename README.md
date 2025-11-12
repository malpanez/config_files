# config_files
Curated configuration files ready to be symlinked into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/).

## Usage
1. Install GNU Stow (`sudo apt install stow` on Debian/Ubuntu).
2. Clone this repo somewhere fixed, e.g. `~/repos/config_files`.
3. From the repo root, stow any tool you want:
   - `stow -t ~ vim` to link `~/.vimrc`
   - `stow -t ~ curl` to link `~/.curlrc`
   - `stow -t ~ wget` to link `~/.wgetrc`
   - `stow -t ~ dig` to link `~/.digrc`
   - `stow -t ~ ssh` to link `~/.ssh/config` and `~/.ssh/config.d`
   - `stow -t ~ git` to link `~/.gitconfig` + `~/.gitignore_global`
   - `stow -t ~ bash` to link `~/.bashrc` + `~/.bash_profile`
   - `stow -t ~ starship` to link `~/.config/starship.toml`
   - `stow -t ~ uv` to link `~/.config/uv/uv.toml`
   - `stow -t ~ vscode` to link `~/.config/Code/User/settings.json`
   - `stow -t ~ tmux` to link `~/.tmux.conf`
   - `stow -t ~ htop` to link `~/.config/htop/htoprc`

Re-run stow with `-D` to remove a package (e.g. `stow -D -t ~ curl`).

## Contents
- `vim/.vimrc` &mdash; improved defaults: relative numbers, clipboard integration, aggressive whitespace cleanup, and sensible per-language indentation tweaks.
- `curl/.curlrc` &mdash; redirects, compression, retries, and bandwidth safety limits for reliable transfers.
- `wget/.wgetrc` &mdash; HSTS storage, resume support, IPv4 preference, connection timeouts, and friendlier progress rendering.
- `dig/.digrc` &mdash; concise answer-oriented output with stats, comments, and multi-line formatting.
- `ssh/.ssh/config` &mdash; hardened global defaults plus automatic inclusion of per-host snippets under `config.d/` (ships with a `github.conf` example).
- `git/.gitconfig` &mdash; sane defaults for rebase-on-pull, histogram diff, aliases, and per-directory include rules. Ships with `git/.gitignore_global`.
- `bash/.bashrc` &mdash; WSL-friendly shell bootstrap that wires oh-my-bash if present, falls back to Starship, adds UV env tuning, and loads `~/.bashrc.d/*.bash` snippets. Paired with `bash/.bash_profile`.
- `starship/.config/starship.toml` &mdash; portable prompt theme compatible with Bash, Zsh, and Fish if you install [starship](https://starship.rs/).
- `uv/.config/uv/uv.toml` &mdash; opinionated defaults for the modern Python `uv` tool (prefer offline cache, require venvs).
- `vscode/.config/Code/User/settings.json` &mdash; best-practice VS Code settings covering Terraform, Python/uv, Go, LaTeX, and Ansible. Extra profile JSON files live under `vscode/profiles/`.
- `tmux/.tmux.conf` &mdash; mouse mode, vi keybindings, smarter splits, and a lightweight status bar theme.
- `htop/.config/htop/htoprc` &mdash; tuned meters, kernel-thread hiding, and helpful highlight options.
- `check_fs_space.bash` &mdash; wrapper over `du` that highlights largest directories with human output and CLI flags.

Feel free to duplicate a directory to craft additional Stow packages for other tools in your toolbox.

## Step-by-step Stow walkthrough
1. Install Stow (`sudo apt install stow` or `brew install stow`).
2. `cd ~/repos/config_files`
3. Run `stow -t ~ <package>` for every tool you want.
4. Undo with `stow -D -t ~ <package>`.
Detailed kid-friendly instructions live in `docs/stow.md`.

## Bash + Prompt
- Install [oh-my-bash](https://github.com/ohmybash/oh-my-bash) (`git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash`) if you want the full theme/plugin ecosystem—`bash/.bashrc` auto-detects it.
- When oh-my-bash is absent, the config falls back to [Starship](https://starship.rs/) (cross-shell and works on pure Bash in WSL) and reads `starship/.config/starship.toml`.
- Powerlevel10k is still great for Zsh; if Zsh isn’t available, Starship is the closest equivalent prompt experience on Bash/Fish/Zsh with a single config file.

## SSH layout
- `ssh/.ssh/config` now includes every `~/.ssh/config.d/*.conf`. Drop host-specific files (e.g., `github.conf`, `prod.conf`) into that directory to keep secrets isolated.
- Stow will create the entire tree, so you can add/remove snippets without editing the main config.

## Git scopes
- `git/.gitconfig` is meant for global defaults (e.g., `git config --global --edit`).
- The `includeIf` entries make it easy to add `~/.gitconfig.work` and `~/.gitconfig.personal` for repo-specific overrides—stow or create those files as needed.

## Python + uv
- `uv/.config/uv/uv.toml` nudges uv toward reproducible, cached installs and enforces virtualenv usage.
- Put uv’s bin directory on your PATH (`~/.local/bin`) so the autocomplete hook in `.bashrc` can find it.

## VS Code
- Base settings: stow the `vscode` directory for global defaults.
- Want a specialized setup? Import the profile JSON from `vscode/profiles/<tool>/settings.json` via “Preferences → Profiles → Import”.
- Full extension list + commands live in `docs/vscode.md`.

## Documentation
Every tool has a cheatsheet inside `docs/`:
- `docs/stow.md` — GNU Stow basics.
- `docs/bash.md` — oh-my-bash + Starship instructions.
- `docs/vscode.md` — VS Code install, extensions, and profiles.
- `docs/ssh.md` — how to add host snippets safely.
- `docs/git.md` — global vs scoped Git config.
- `docs/python-uv.md` — uv install + usage flow.
- `docs/roadmap.md` — future enhancements (Neovim, Cursor/Zed, devcontainers, etc.).

## Make it your own
- Need Cursor/Zed configs, devcontainers, or Neovim? Check `docs/roadmap.md` and open an issue/PR.
- Want per-tool quickstarts? Add another markdown file into `docs/` and stow the companion config.
