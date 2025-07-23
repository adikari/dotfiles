# Agent Guidelines for Dotfiles Repository

## Build/Test/Lint Commands
- **Setup**: `./scripts/init` - Main installation script for dotfiles
- **Lua formatting**: `stylua .` - Format Lua files (uses .stylua.toml config)
- **Shell scripts**: Use `shellcheck` for linting shell scripts
- **No test suite** - This is a personal dotfiles repository

## Code Style Guidelines

### Shell Scripts
- Use `#!/bin/bash` shebang with `set -euo pipefail`
- Use double quotes for variables: `"$variable"`
- Prefer `$(command)` over backticks
- Use meaningful variable names in snake_case

### Lua (Neovim config)
- 2-space indentation, 120 character line width
- Use double quotes for strings (AutoPreferDouble)
- No call parentheses for single string/table arguments
- Follow existing NvChad patterns and structure

### Configuration Files
- Use consistent indentation (2 spaces for most configs)
- Follow existing patterns in each config type
- Maintain Catppuccin Mocha theme consistency across configs
- Use XDG Base Directory specification paths

### Error Handling
- Shell scripts should fail fast with `set -euo pipefail`
- Log important operations to `/tmp/dotfiles.log`
- Use conditional checks before creating symlinks or directories