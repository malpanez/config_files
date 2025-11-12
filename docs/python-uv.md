# Python + uv Guide

1. **Install uv**
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```
   Binaries land in `~/.local/bin` (already added by `.bashrc`).
2. **Link the config**
   ```bash
   cd ~/repos/config_files
   stow -t ~ uv
   ```
   Creates `~/.config/uv/uv.toml` with sane defaults.
3. **Create a project venv**
   ```bash
   uv venv
   source .venv/bin/activate
   ```
4. **Install deps**
   ```bash
   uv pip install -r requirements.txt
   ```
5. **Run tools**
   ```bash
   uv run pytest
   uv run black .
   ```

> uv is super fast, works offline, and the config here enforces virtualenv usage so you don’t accidentally install global packages.
