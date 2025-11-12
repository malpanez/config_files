# SSH Guide

1. **Link configs**
   ```bash
   cd ~/repos/config_files
   stow -t ~ ssh
   ```
2. **Add keys**
   - Generate: `ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "you@example.com"`
   - Copy public key to servers / GitHub.
3. **Per-host files**
   - Drop `*.conf` files in `~/.ssh/config.d/`. Example: `github.conf` already provided.
   - Format:
     ```
     Host myserver
         HostName 10.0.0.5
         User ubuntu
         IdentityFile ~/.ssh/id_ed25519_myserver
     ```
4. **Permissions**
   ```bash
   chmod 700 ~/.ssh
   chmod 600 ~/.ssh/config ~/.ssh/config.d/*.conf
   ```
5. **Test**
   ```bash
   ssh -T github.com
   ssh myserver
   ```

> Modular layout keeps secrets split per file and plays nicely with enterprise policies.
