# AGENTS.md

## Commands

- **Lint**: `stylua --check .` (format with `stylua .`)
- **No build/test**: This is a Neovim configuration, not a package
- **Shell**: Configured to use `nu` (Nushell) by default

## Code Style

- **Language**: Lua with LazyVim framework
- **Imports**: Use `require("module")` - no explicit import organization needed
- **Functions**: Define with `function name()` or `local name = function()`
- **Plugin opts**: Prefer `opts = {}` tables in lazy.nvim specs; use `opts = function(_, opts)` only when a plain merged table is not enough
- **Error handling**: Use `vim.notify()` for user messages, `vim.api.nvim_echo()` for critical errors

## lazy.nvim Plugin Config Guide

- **Default shape**: Prefer declarative plugin specs with `opts = {}` instead of `config = function()`; lazy.nvim will merge `opts` with parent specs automatically
- **Lists that should extend**: When a list should append to parent values instead of replacing them, use `opts_extend = { "path.to.list" }`
- **Good fits for plain `opts`**: Use table `opts` for nested maps like `servers`, `settings`, keymaps specs, and `ensure_installed` when the parent spec already defines `opts_extend`
- **When to use `opts` functions**: Only use `opts = function(_, opts)` when you need conditional logic, computed values that depend on current state, or in-place mutation that cannot be expressed cleanly as a table
- **Avoid redundant merging**: Do not wrap nested tables in `vim.tbl_deep_extend()` just to add fields that lazy.nvim can already merge for you
- **Use `config` sparingly**: Reserve `config` for plugins that truly need custom setup code beyond `require(MAIN).setup(opts)`

## Structure

- **Main entry**: `init.lua` - branches to VSCode (`noidilin/`) or full config (`config/`)
- **Plugins**: Define in `lua/plugins/` with lazy.nvim format `return { ... }`
- **Config**: Core config in `lua/config/` (options, keymaps, autocmds, lazy.lua)
- **VSCode**: Separate config in `lua/noidilin/` for VS Code Neovim extension
- **Theme**: Custom Lush theme in `lua/theme/` with organized subdirectories:
  - `colors/` - Color definitions
  - `lua/lush_core/` - Core highlighting
  - `lua/lush_plugin/` - Active plugin themes
  - `lua/lush_stale/` - Archived plugin themes
  - `lua/lush_theme/` - Theme architecture

## Naming

- Use snake_case for files and variables
- Use kebab-case for plugin file names (e.g., `_lsp-config.lua`)
- Prefix archived/disabled files with `_` (e.g., `_archived.lua`)
- Use descriptive variable names: `lazypath`, `lazyrepo`, etc.
