local vscode = require('vscode')
local map = vim.keymap.set

-- [[ User interface ]]
-- colorscheme with preview | preferences: color theme <c-k><c-t>
map('n', '<leader>uc', function()
	vscode.call('workbench.action.selectTheme')
end, { silent = true })
map('n', '<leader>uw', function()
	vscode.call('editor.action.toggleWordWrap')
end, { silent = true })

-- [[ setting and keybinding ]]
map('n', '<leader>sc', function()
	vscode.call('workbench.action.openSettings')
end, { silent = true })
-- open keyboard shortcuts list
map('n', '<leader>sk', function()
	vscode.call('workbench.action.openGlobalKeybindings')
end, { silent = true })
-- open user setting JSON
map('n', '<leader>fc', function()
	vscode.call('workbench.action.openSettingsJson')
end, { silent = true })
-- open keyboard shortcuts JSON
map('n', '<leader>fk', function()
	vscode.call('workbench.action.openGlobalKeybindingsFile')
end, { silent = true })
