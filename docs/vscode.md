# VS Code Setup (Step-by-step)

## 1. Install VS Code + extensions
Use the official installers (or `code` via apt/brew). Then install these extensions:
- `ms-python.python`
- `ms-python.vscode-pylance`
- `charliermarsh.ruff`
- `hashicorp.terraform`
- `golang.go`
- `redhat.ansible`
- `James-Yu.latex-workshop`
- `GitHub.copilot`

Command:
```bash
code --install-extension ms-python.python \
     --install-extension ms-python.vscode-pylance \
     --install-extension charliermarsh.ruff \
     --install-extension hashicorp.terraform \
     --install-extension golang.go \
     --install-extension redhat.ansible \
     --install-extension James-Yu.latex-workshop \
     --install-extension GitHub.copilot
```

## 2. Link the base settings
```bash
cd ~/repos/config_files
stow -t ~ vscode
```
This creates `~/.config/Code/User/settings.json` (Linux/WSL). For macOS/Windows, copy the file to:
- macOS: `~/Library/Application Support/Code/User/settings.json`
- Windows: `%APPDATA%\Code\User\settings.json`

## 3. Optional profiles
Use the files in `vscode/profiles/*/settings.json` as per-project overlays:
1. Open VS Code → Command Palette → `Preferences: Create Profile...` → `Import Profile...`
2. Select the JSON you want (Python Focus, Terraform Ops, Go Builder, LaTeX Author, Ansible Ops).

## 4. Extra goodies
- Terraform: run `brew/apt install terraform-ls` for the language server.
- Go: `go install golang.org/x/tools/gopls@latest` and `go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest`.
- Python/uv: install uv (`curl -LsSf https://astral.sh/uv/install.sh | sh`) so VS Code can call it.

> After these steps, VS Code will auto-format, lint, and test the languages you listed without extra clicks.
