-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.shell = 'nu'

-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true

-- enable chinese
vim.opt.spelllang = { 'en', 'cjk' }

-- set to `true` to follow the main branch
-- you need to have a working rust toolchain to build the plugin
-- in this case.
-- vim.g.lazyvim_blink_main = true
