-- achroma -- follows 'background'.
--
-- Deliberately does NOT force `vim.opt.background` any more. Neovim 0.10+
-- queries the terminal's background with OSC 11 and sets 'background' from the
-- reply, so leaving it alone lets the editor follow wezterm -- and therefore the
-- Windows app theme -- on its own. `:set background=light` also flips it live,
-- via the OptionSet autocmd in lua/achroma.lua.
--
-- Use achroma-light / achroma-dark to pin a variant instead.
--
-- The loader clears the cached spec tree (lush_theme.*, lush_core.*,
-- lush_plugin.*) before re-requiring, so the palette variant in
-- lush_theme/_primitive.lua is re-evaluated on every apply.

require('achroma').load('achroma')
