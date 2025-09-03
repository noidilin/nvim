local vscode = require("vscode")
local map = vim.keymap.set

-- mapping the nvim-dap keybinding into vscode, but not test any of them yet.
-- TODO: test the similiarity between keybinding behavior

-- [[ View ]]
map("n", "<leader>du", function() vscode.call("workbench.view.debug") end, { silent = true })                      -- Dap UI | view: toggle run and debug <CS-d>
map("n", "<leader>dr", function() vscode.call("workbench.debug.action.toggleRepl") end, { silent = true })         -- toggle REPL | view: toggle debug console <CS-y>
map("n", "<leader>ds", function() vscode.call("workbench.action.debug.selectDebugSession") end, { silent = true }) -- session | debug: select debug session

-- [[ breakpoint, start ]]
map("n", "<leader>d", function() vscode.call("workbench.action.debug.start") end, { silent = true })                -- +debug | debug: start debugging <F5>
map("n", "<leader>db", function() vscode.call("editor.debug.action.toggleBreakpoint") end, { silent = true })       -- toggle breakpoint | debug: toggle breakpoint <F9>
map("n", "<leader>dB", function() vscode.call("editor.debug.action.toggleInlineBreakpoint") end, { silent = true }) -- vscode: debug: toggle inline breakpoint <S-F9>
map("n", "<leader>dC", function() vscode.call("editor.debug.action.runToCursor") end, { silent = true })            -- run to cursor | debug: run to cursor
map("n", "<leader>dg", function() vscode.call("workbench.action.debug.run") end, { silent = true })                 -- go to line (no execute) | debug: start without debugging <C-F5>

-- [[ continue, pause, stop ]]
map("n", "<leader>dc", function() vscode.call("workbench.action.debug.continue") end, { silent = true }) -- continue | debug: continue <F5>
map("n", "<leader>dp", function() vscode.call("workbench.action.debug.pause") end, { silent = true })    -- pause | debug: pause <F6>
map("n", "<leader>dt", function() vscode.call("workbench.action.debug.stop") end, { silent = true })     -- terminate | debug: stop <S-F5>

-- [[ Call Stack ]]
map("n", "<leader>dj", function() vscode.call("workbench.action.debug.callStackDown") end, { silent = true }) -- down | debug: navigate down call stack
map("n", "<leader>dk", function() vscode.call("workbench.action.debug.callStackUp") end, { silent = true })   -- up | debug: navigate up call stack

-- [[ step ]]
map("n", "<leader>di", function() vscode.call("workbench.action.debug.stepInto") end, { silent = true }) -- step into | debug: step into <F11>
map("n", "<leader>do", function() vscode.call("workbench.action.debug.stepOut") end, { silent = true })  -- step out | debug: step out <S-F11>
map("n", "<leader>dO", function() vscode.call("workbench.action.debug.stepOver") end, { silent = true }) -- step over | debug: step over <F10>

-- [[ Testing: neotest ]]
map("n", "<leader>t", function() vscode.call("workbench.view.extension.test") end, { silent = true })          -- +test | view: show testing
map("n", "<leader>to", function() vscode.call("testing.openOutputPeek") end, { silent = true })                -- show output | test: peek output
map("n", "<leader>tO", function() vscode.call("workbench.action.output.toggleOutput") end, { silent = true })  -- toggle output panel | test: show output
map("n", "<leader>tW", function() vscode.call("workbench.debug.action.focusWatchView") end, { silent = true }) -- toggle watch | run and debug: focus on watch view
map("n", "<leader>tw", function() vscode.call("editor.debug.action.selectionToWatch") end, { silent = true })  -- VSCODE ONLY: debug: add to watch
map("n", "<leader>td", function() vscode.call("testing.debugAtCursor") end, { silent = true })                 -- debug nearest | test: debug tests at cursor
map("n", "<leader>tr", function() vscode.call("testing.runAtCursor") end, { silent = true })                   -- run nearest | test: run tests at cursor
map("n", "<leader>tl", function() vscode.call("testing.reRunLastRun") end, { silent = true })                  -- run last | test: rerun last run
map("n", "<leader>tt", function() vscode.call("testing.runCurrentFile") end, { silent = true })                -- run file | test: run tests in current file
map("n", "<leader>tT", function() vscode.call("testing.runAll") end, { silent = true })                        -- run all test files | test: run all tests
map("n", "<leader>tS", function() vscode.call("testing.stopContinuousRun") end, { silent = true })             -- stop | test: stop continuous run
