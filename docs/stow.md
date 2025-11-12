# How to Use GNU Stow (Super Easy Version)

1. **Install Stow**
   - Ubuntu/WSL: `sudo apt install stow`
   - macOS (Homebrew): `brew install stow`
2. **Go to this repo**
   ```bash
   cd ~/repos/config_files
   ```
3. **Pick the tool you want** (each folder is a "box" of files)
   - Example: `vim`, `bash`, `ssh`, `git`, `vscode`, etc.
4. **Link it into your home**
   ```bash
   stow -t ~ bash
   stow -t ~ vim
   stow -t ~ ssh
   ```
   This creates symlinks in `~` pointing back to the repo, so updates here instantly show up in your real configs.
5. **Undo (if you change your mind)**
   ```bash
   stow -D -t ~ bash
   ```
6. **WSL Hint**
   - Use the same commands; they target `/home/<you>` inside WSL.

> Think of GNU Stow as a magic sticker book: stick the folder name on your home directory and boom—the files appear without copies.
