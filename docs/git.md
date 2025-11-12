# Git Guide

1. **Link the config**
   ```bash
   cd ~/repos/config_files
   stow -t ~ git
   ```
2. **Set your identity**
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "you@example.com"
   ```
3. **Optional scoped configs**
   - Create `~/.gitconfig.work` or `~/.gitconfig.personal` with overrides (tokens, signing keys).
4. **Credential helper**
   - Windows: Git Credential Manager UI pops up automatically.
   - Linux/macOS: install `git-credential-manager` if missing.
5. **FSMonitor hint**
   - Run `git config --global core.fsmonitor true` only if your Git version supports it (2.37+). Already enabled in this config.

> Result: consistent aliases, diff settings, `rebase.pull=true`, `defaultBranch=main`, and auto pruning.
