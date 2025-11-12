# Bash / Prompt Guide

1. **Install oh-my-bash (optional but fun)**
   ```bash
   git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
   ```
2. **Install Starship (for a pretty prompt everywhere)**
   ```bash
   curl -sS https://starship.rs/install.sh | sh
   ```
3. **Link the configs**
   ```bash
   cd ~/repos/config_files
   stow -t ~ bash
   stow -t ~ starship
   ```
4. **Open a new terminal**
   - If `~/.oh-my-bash` exists, that theme runs.
   - If not, Starship shows the same prompt on Bash/WSL/Mac.
5. **Add personal tweaks**
   - Drop extra scripts in `~/.bashrc.d/*.bash`; they are sourced automatically.

> Summary: install oh-my-bash + Starship once, stow the `bash` folder, and enjoy a consistent prompt everywhere.
