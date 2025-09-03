local vscode = require("vscode")
local map = vim.keymap.set

-- [[ delete ]]
map("n", "<leader>bd", function() vscode.call("workbench.action.closeActiveEditor") end, { silent = true })      -- delete buffer | close active editor <C-w>
map("n", "<leader>bo", function() vscode.call("workbench.action.closeOtherEditors") end, { silent = true })      -- delete other buffers | close other editors
map("n", "<leader>bl", function() vscode.call("workbench.action.closeEditorsToTheLeft") end, { silent = true })  -- delete buffers to the left | close editors to the left
map("n", "<leader>br", function() vscode.call("workbench.action.closeEditorsToTheRight") end, { silent = true }) -- delete buffers to the right | close editors to the right

-- swtich most recent buffer "<leader>bb" | view: quick open previous recently used editor in group "<C-Tab>"
---- vscode command that target editor between all group: "workbench.action.quickOpenPreviousRecentlyUsedEditor"
map("n", "<leader>bb", function()
  vscode.call("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
  vscode.call("list.select")
end, { silent = true })
map("n", "<leader>`", function()
  vscode.call("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
  vscode.call("list.select")
end, { silent = true })

-- [[ Navigate, move ]]
map("n", "[b", function() vscode.call("workbench.action.previousEditor") end, { silent = true })         -- navigate buffer | view: open previous editor <C-PgUp>
map("n", "]b", function() vscode.call("workbench.action.nextEditor") end, { silent = true })             -- navigate buffer | view: open previous editor <C-PgDn>
map("n", "[B", function() vscode.call("workbench.action.moveEditorLeftInGroup") end, { silent = true })  -- move buffer | move editor left <CS-PgUp>
map("n", "]B", function() vscode.call("workbench.action.moveEditorRightInGroup") end, { silent = true }) -- move buffer | move editor left <CS-PgDn>

-- [[ Index ]]
map("n", "<leader>bh", function() vscode.call("workbench.action.openPreviousEditorFromHistory") end, { silent = true }) -- VSCODE ONLY: previously opened editor History
map("n", "<leader>b1", function() vscode.call("workbench.action.openEditorAtIndex1") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b2", function() vscode.call("workbench.action.openEditorAtIndex2") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b3", function() vscode.call("workbench.action.openEditorAtIndex3") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b4", function() vscode.call("workbench.action.openEditorAtIndex4") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b5", function() vscode.call("workbench.action.openEditorAtIndex5") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b6", function() vscode.call("workbench.action.openEditorAtIndex6") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b7", function() vscode.call("workbench.action.openEditorAtIndex7") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b8", function() vscode.call("workbench.action.openEditorAtIndex8") end, { silent = true })            -- VSCODE ONLY: navigate buffer based on index
map("n", "<leader>b9", function() vscode.call("workbench.action.lastEditorInGroup") end, { silent = true })             -- VSCODE ONLY: navigate buffer based on index

-- [[ smart split ]]
map("n", "g<leader>h", function() vscode.call("workbench.action.moveEditorToLeftGroup") end, { silent = true })  -- swap buffer to left | move editor into left group <CS-h>
map("n", "g<leader>j", function() vscode.call("workbench.action.moveEditorToBelowGroup") end, { silent = true }) -- swap buffer to below | move editor into left group <CS-j>
map("n", "g<leader>k", function() vscode.call("workbench.action.moveEditorToAboveGroup") end, { silent = true }) -- swap buffer to above | move editor into left group <CS-k>
map("n", "g<leader>l", function() vscode.call("workbench.action.moveEditorToRightGroup") end, { silent = true }) -- swap buffer to right | move editor into left group <CS-l>
