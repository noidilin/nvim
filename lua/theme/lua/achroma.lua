-- Shared loader for the achroma colorschemes.
--
--   :colorscheme achroma         -- follows 'background' (auto)
--   :colorscheme achroma-light   -- pins light
--   :colorscheme achroma-dark    -- pins dark
--
-- The palette variant is chosen in lush_theme/_primitive.lua from
-- `vim.o.background`. That binding happens at module load, so every entry point
-- has to drop the cached spec tree before re-requiring, otherwise the specs are
-- rebuilt from the previous variant's palette.

local M = {}

local CACHED_PREFIXES = {
	"^lush_theme%.",
	"^lush_core%.",
	"^lush_plugin%.",
	"^lush_stale%.",
}

local function flush_spec_cache()
	for name, _ in pairs(package.loaded) do
		for _, prefix in ipairs(CACHED_PREFIXES) do
			if name:match(prefix) then
				package.loaded[name] = nil
				break
			end
		end
	end
end

-- Guards the OptionSet autocmd against the `vim.o.background` write below.
local applying = false

---@param name string colorscheme name, e.g. "achroma" or "achroma-light"
---@param background? "light"|"dark" pin a variant; nil honors vim.o.background
function M.load(name, background)
	if applying then
		return
	end
	applying = true

	if background and vim.o.background ~= background then
		vim.o.background = background
	end

	vim.g.colors_name = name

	flush_spec_cache()
	require("lush")(require("lush_theme.main"))

	applying = false
end

-- `:set background=light` does not re-run the colorscheme, and on Neovim 0.10+
-- 'background' is also set asynchronously from the terminal's OSC 11 reply --
-- which is how this follows wezterm automatically. Re-apply on both.
--
-- Only the auto entry point reacts; achroma-light / achroma-dark are pins.
vim.api.nvim_create_autocmd("OptionSet", {
	group = vim.api.nvim_create_augroup("achroma_background", { clear = true }),
	pattern = "background",
	callback = function()
		if vim.g.colors_name == "achroma" then
			M.load("achroma")
		end
	end,
})

---Flip between light and dark, keeping the auto colorscheme active.
function M.toggle()
	vim.o.background = vim.o.background == "dark" and "light" or "dark"
	if vim.g.colors_name ~= "achroma" then
		M.load("achroma")
	end
end

return M
