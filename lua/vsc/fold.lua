local vscode = require("vscode")
local map = vim.keymap.set

-- [[ Fold Command ]]
-- Fold basic
map("n", "za", function() vscode.call("editor.toggleFold") end, { silent = true })
map("n", "zo", function() vscode.call('editor.unfold') end, { silent = true })
map("n", "zc", function() vscode.call('editor.fold') end, { silent = true })
-- Jump to next fold
map("n", "zj", function() vscode.call('editor.gotoNextFold') end, { silent = true })
map("n", "zk", function() vscode.call('editor.gotoPreviousFold') end, { silent = true })
-- Fold recursively
map("n", "zO", function() vscode.call('editor.unfoldRecursively') end, { silent = true })
map("n", "zC", function() vscode.call('editor.foldRecursively') end, { silent = true })
-- Fold all
map("n", "zR", function() vscode.call('editor.unfoldAll') end, { silent = true })
map("n", "zM", function() vscode.call('editor.foldAll') end, { silent = true })
-- Fold all except
map("n", "zV", function() vscode.call('editor.foldAllExcept') end, { silent = true })
-- Fold level
map("n", "z1", function() vscode.call('editor.foldLevel1') end, { silent = true })
map("n", "z2", function() vscode.call('editor.foldLevel2') end, { silent = true })
map("n", "z3", function() vscode.call('editor.foldLevel3') end, { silent = true })
map("n", "z4", function() vscode.call('editor.foldLevel4') end, { silent = true })
map("n", "z5", function() vscode.call('editor.foldLevel5') end, { silent = true })
map("n", "z6", function() vscode.call('editor.foldLevel6') end, { silent = true })
map("n", "z7", function() vscode.call('editor.foldLevel7') end, { silent = true })
