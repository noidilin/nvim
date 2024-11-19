local vscode = require("vscode")
local map = vim.keymap.set

-- [[ split ]]
map("n", "<leader>w|", function() vscode.call("workbench.action.splitEditor") end, { silent = true })     -- split window right | split editor
map("n", "<leader>w-", function() vscode.call("workbench.action.splitEditorDown") end, { silent = true }) -- split window down | split editor down
map("n", "<leader>|", function() vscode.call("workbench.action.splitEditor") end, { silent = true })      -- split window right | split editor
map("n", "<leader>-", function() vscode.call("workbench.action.splitEditorDown") end, { silent = true })  -- split window down | split editor down

-- [[ close ]]
map("n", "<leader>wd", function() vscode.call("workbench.action.closeEditorsAndGroup") end, { silent = true }) -- close window | close editor group

-- [[ resize]]
map("n", "<leader>w=", function() vscode.call("workbench.action.evenEditorWidths") end, { silent = true })          -- resize window | view: reset editor group sizes
map("n", "<leader>w+", function() vscode.call("workbench.action.toggleEditorWidths") end, { silent = true })        -- vscode only: view: toggle editor group sizes
map("n", "<leader>wm", function() vscode.call("workbench.action.toggleMaximizeEditorGroup") end, { silent = true }) -- maximize toggle | view: toggle maximize editor group
