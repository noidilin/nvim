# AGENTS.md - Neovim Configuration

## Commands
- **Lint**: `stylua --check .` (format with `stylua .`)  
- **No build/test**: This is a Neovim configuration, not a package
- **Plugin management**: Use `:Lazy` commands in Neovim (`:Lazy sync`, `:Lazy update`)
- **Shell**: Configured to use `nu` (Nushell) by default

## Code Style
- **Language**: Lua with LazyVim framework
- **Formatter**: StyLua with default settings, except `call_parentheses = "Input"` in color-fatigue theme
- **Imports**: Use `require("module")` - no explicit import organization needed
- **Comments**: Use `--` for single line, `--[[]]` for multi-line, `-- stylua: ignore` for exceptions
- **Strings**: Use double quotes by convention  
- **Tables**: Trailing commas preferred for multi-line tables
- **Functions**: Define with `function name()` or `local name = function()`
- **Plugin opts**: Always use `opts = {}` table format in lazy.nvim specs
- **Error handling**: Use `vim.notify()` for user messages, `vim.api.nvim_echo()` for critical errors

## Structure
- **Main entry**: `init.lua` - branches to VSCode (`noidilin/`) or full config (`config/`)
- **Plugins**: Define in `lua/plugins/` with lazy.nvim format `return { ... }`
- **Config**: Core config in `lua/config/` (options, keymaps, autocmds, lazy.lua)
- **VSCode**: Separate config in `lua/noidilin/` for VS Code Neovim extension
- **Color theme**: Custom theme in `lua/plugins/color-fatigue/`

## Naming
- Use snake_case for files and variables
- Use kebab-case for plugin file names (e.g., `_lsp-config.lua`)
- Prefix archived/disabled files with `_` (e.g., `_archived.lua`)
- Use descriptive variable names: `lazypath`, `lazyrepo`, etc.