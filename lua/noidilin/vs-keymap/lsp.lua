-- directly navigate toward or go to the place that is related to certain object.

local vscode = require("vscode")
local map = vim.keymap.set

-- [[ View ]]
map("n", "<leader>xx", function() vscode.call("workbench.actions.view.problems") end, { silent = true })              -- diagnostics (trouble) "<leader>xx" | view: toggle problems "<CS-m>"
map("n", "<leader>xT", function() vscode.call("workbench.view.extension.todo-tree-container") end, { silent = true }) -- todo/fix/fixme (trouble) "<leader>xT" | view: show todos
map("n", "<leader>xr", function() vscode.call("references-view.findReferences") end, { silent = true })               --- VSCODE ONLY: references: find all references "<leader>xr"

-- [[ Navigation ]]
map("n", "[d", function() vscode.call("editor.action.marker.prevInFiles") end, { silent = true }) -- prev diagnostic "[d" | go to prev error or warning in files "<S-F8>"
map("n", "]d", function() vscode.call("editor.action.marker.nextInFiles") end, { silent = true }) -- next diagnostic "]d" | go to next error or warning in files "<F8>"
map("n", "[D", function() vscode.call("editor.action.marker.prev") end, { silent = true })        -- VSCODE ONLY: go to prev error or warning "[D"
map("n", "]D", function() vscode.call("editor.action.marker.next") end, { silent = true })        -- VSCODE ONLY: go to next error or warning "]D"
map("n", "[t", function() vscode.call("todo-tree.goToPrevious") end, { silent = true })           -- prev todo comment "[t" | todo tree: go to prev
map("n", "]t", function() vscode.call("todo-tree.goToNext") end, { silent = true })               -- next todo comment "]t" | todo tree: go to next

-- [[ Go to... ]]
map("n", "gd", function() vscode.call("editor.action.revealDefinition") end, { silent = true })   -- goto definition "gd" | go to definition "<F12>"
map("n", "gI", function() vscode.call("editor.action.goToImplementation") end, { silent = true }) -- goto implementation "gI" | go to implementation "<C-F12>"
map("n", "gy", function() vscode.call("editor.action.goToTypeDefinition") end, { silent = true }) -- goto type definition "gy" | go to type definition
map("n", "gD", function() vscode.call("editor.action.revealDeclaration") end, { silent = true })  -- goto  declaration "gD" | go to declaration
map("n", "gr", function() vscode.call("editor.action.goToReferences") end, { silent = true })     -- go to reference | go to reference "<S-F12>"

-- [[ Peek: VSCODE ONLY ]]
--- VSCODE ONLY: peek definition, declaration
map("n", "gpd", function() vscode.call("editor.action.peekDefinition") end, { silent = true })
map("n", "gpI", function() vscode.call("editor.action.peekImplementation") end, { silent = true })
map("n", "gpy", function() vscode.call("editor.action.peekTypeDefinition") end, { silent = true })
map("n", "gpD", function() vscode.call("editor.action.peekDeclaration") end, { silent = true })
map("n", "gpr", function() vscode.call("editor.action.referenceSearch.trigger") end, { silent = true })

-- [[ Action ]]
map("n", "<leader>cs", function() vscode.call("breadcrumbs.focusAndSelect") end, { silent = true })       -- symbols (trouble) "<leader>cs" | focus and select breadcrumbs "<CS-.>"
map({ "n", "v" }, "<leader>ca", function() vscode.call("editor.action.quickFix") end, { silent = true })  -- code action "<leader>ca" | quick fix... "<C-.>"
map("n", "<leader>cc", function() vscode.call("codelens.showLensesInCurrentLine") end, { silent = true }) -- run codelens "<leader>cc" | show code lens command for current line
map("n", "<leader>cr", function() vscode.call("editor.action.rename") end, { silent = true })             -- rename "<leader>cr" | rename symbol "<F2>"
