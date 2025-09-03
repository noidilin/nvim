-- needs to further type out or pass a search keyword to find/ search

local vscode = require("vscode")
local map = vim.keymap.set

-- [[ View ]]
map("n", "<leader>e", function() vscode.call("workbench.view.explorer") end, { silent = true })  -- explorer neotree (root dir) | view: show explorer <CS-e>
map("n", "<leader>fe", function() vscode.call("workbench.view.explorer") end, { silent = true }) -- explorer neotree (root dir) | view: show explorer <CS-e>

-- [[ Find ]]
map("n", "<leader>ff", function() vscode.call("workbench.action.quickOpen") end, { silent = true })      -- find files | go to file... <C-e> / <A-o>
map("n", "<leader>fr", function() vscode.call("workbench.action.openRecent") end, { silent = true })     -- recent | open recent <C-r> / <C-w><C-r>
map("n", "<leader>fb", function() vscode.call("workbench.action.showAllEditors") end, { silent = true }) -- buffers, switch buffer | show all editor by appearance
map("n", "<leader>,", function() vscode.call("workbench.action.showAllEditors") end, { silent = true })  -- buffers, switch buffer | show all editor by appearance

-- [[ vscode only ]]
map("n", "<leader>fo", function() vscode.call("workbench.action.files.openFile") end, { silent = true })
map("n", "<leader>fO", function() vscode.call("workbench.action.files.openFolder") end, { silent = true })

-- [[ Search ]]
map("n", "<leader>sb", function() vscode.call("actions.find") end, { silent = true })                    -- buffers | find <C-f>
map("n", "<leader>sg", function() vscode.call("workbench.action.findInFiles") end, { silent = true })    -- grep (root dir) | search: find in files (view: show search) <CS-f>
map("n", "<leader>sr", function() vscode.call("workbench.action.replaceInFiles") end, { silent = true }) -- replace in files (spectre) | search: replace in files <CS-h>
map("n", "<leader>sw", function() vscode.call("actions.findWithSelection") end, { silent = true })       -- word (root dir) | find with selection

-- [[ Symbol ]]
map("n", "<leader>ss", function() vscode.call("workbench.action.gotoSymbol") end, { silent = true })     -- goto symbol | go to symbol in editor <CS-o>
map("n", "<leader>sS", function() vscode.call("workbench.action.showAllSymbols") end, { silent = true }) -- goto symbol (workspace) | go to symbol in workspace
