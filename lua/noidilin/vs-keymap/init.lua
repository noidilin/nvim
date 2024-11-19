require("noidilin.vs-keymap.fold")
require("noidilin.vs-keymap.buffer")
require("noidilin.vs-keymap.window")
require("noidilin.vs-keymap.telescope")
require("noidilin.vs-keymap.lsp")
require("noidilin.vs-keymap.dap")

local vscode = require("vscode")
local map = vim.keymap.set

-- [[ User interface ]]
-- colorscheme with preview | preferences: color theme <c-k><c-t>
map("n", "<leader>uc", function() vscode.call("workbench.action.selectTheme") end, { silent = true })
map("n", "<leader>uw", function() vscode.call("editor.action.toggleWordWrap") end, { silent = true })

-- [[ setting and keybinding ]]
map("n", "<leader>sc", function() vscode.call("workbench.action.openSettings") end, { silent = true })
-- open keyboard shortcuts list
map("n", "<leader>sk", function() vscode.call("workbench.action.openGlobalKeybindings") end, { silent = true })
-- open user setting JSON
map("n", "<leader>fc", function() vscode.call("workbench.action.openSettingsJson") end, { silent = true })
-- open keyboard shortcuts JSON
map("n", "<leader>fk", function() vscode.call("workbench.action.openGlobalKeybindingsFile") end, { silent = true })

-- [[ editing ]]
---- currently not working
-- map("n", "]s", function() vscode.call("editor.action.addSelectionToNextFindMatch") end, { silent = true })

-- [[ Locations ]]
---- disable these, since editing in normal mode and insert mode will confuse vscode
-- navigation locations (go to definition)
-- map("n", "<C-o>", function() vscode.call("workbench.action.navigateBackInNavigationLocations") end, { silent = true })
-- map("n", "<C-i>", function() vscode.call("workbench.action.navigateForwardInNavigationLocations") end, { silent = true })
-- edit Locations
-- map("n", "<C-t>", function() vscode.call("workbench.action.navigateBackInEditLocations") end, { silent = true })
-- map("n", "<Tab>", function() vscode.call("workbench.action.navigateForwardInEditLocations") end, { silent = true })
