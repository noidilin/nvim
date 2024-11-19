-- [[ Setting options ]] (see `:help vim.opt` or `:help option-list`)
--
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "       -- set <space> as the leader key (see `:help mapleader`)
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true -- set to true if you have a Nerd Font installed

vim.opt.signcolumn = "yes"  -- keep signcolumn on by default
vim.opt.updatetime = 250    -- decrease update time

-- decrease mapped sequence wait time
vim.opt.timeoutlen = 1000         -- lower number will display which-key popup sooner

vim.opt.clipboard = "unnamedplus" -- sync clipboard between OS and Neovim.
vim.opt.ignorecase = true         -- case-insensitive searching in search or command
vim.opt.smartcase = true          -- don't ignore case with capitals
vim.opt.inccommand = "split"      -- preview substitutions live, as you type!
vim.opt.scrolloff = 15            -- minimal rows of context
vim.opt.sidescrolloff = 8         -- minimal columns of context

vim.opt.number = true             -- line number
vim.opt.relativenumber = true
vim.opt.cursorline = true         -- show which line your cursor is on

vim.opt.splitbelow = true         -- new split open in the below
vim.opt.splitright = true         -- new split open in the right

-- [[ Tab ]]
vim.opt.expandtab = true      -- use space char instead of tab char
vim.opt.tabstop = 2           -- number of spaces tabs count for
vim.opt.smartindent = true    -- insert indents automatically
vim.opt.shiftround = true     -- round indent
vim.opt.shiftwidth = 2        -- set indent with same width

vim.opt.virtualedit = "block" -- position cursor at the place where is no actual character
vim.opt.termguicolors = true  -- make terminal more graphical
vim.opt.hlsearch = true       -- highlight on search
-- vim.opt.showmode = false  -- mode is already in status line
vim.opt.mouse = "a"           -- mouse mode can be useful for resizing splits
-- vim.opt.breakindent = true
vim.opt.undofile = true       -- save undo history
-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { trail = "·", nbsp = "␣" }
vim.opt.spelllang = { "en" }
