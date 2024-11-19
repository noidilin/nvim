## general

| neovim                   |              | vscode                      |              |
| ------------------------ | ------------ | --------------------------- | ------------ |
| colorscheme with preview | `<leader>uc` | preferences: color theme    | `<C-k><C-t>` |
| toggle word wrap         | `<leader>uw` | toggle word wrap            |              |
|                          | `<leader>sc` | open settings               | `<C-,>`      |
|                          | `<leader>sk` | open global keybindings     | `<C-k><C-s>` |
|                          | `<leader>fc` | open setting json           |              |
|                          | `<leader>fk` | open global keybinding json |              |

## fold mapping

| neovim |      | vscode             |     |
| ------ | ---- | ------------------ | --- |
|        | `za` | toggle fold        |     |
|        | `zj` | go to next fold    |     |
|        | `zk` | go to prev fold    |     |
|        | `zo` | unfold             |     |
|        | `zc` | fold               |     |
|        | `zO` | recursively unfold |     |
|        | `zC` | recursively fold   |     |
|        | `zM` | fold all           |     |
|        | `zR` | unfold all         |     |
|        | `zV` | fold all except    |     |
|        | `z1` | fold level 1       |     |

## buffer mapping

| neovim                            |                 | vscode                                 |             |
| --------------------------------- | --------------- | -------------------------------------- | ----------- |
| delete buffer                     | `<leader>bd`    | close active editor                    | `<C-w>`     |
| delete other buffers              | `<leader>bo`    | close other editors                    |             |
| delete buffers to the left        | `<leader>bl`    | close editors to the left              |             |
| delete buffers to the right       | `<leader>br`    | close editors to the right             |             |
| switch most recent buffer         | `<leader>bb`    | open previous recently editor in group | `<C-Tab>`   |
| switch most recent buffer         | `` <leader>` `` | open previous recently editor in group | `<C-Tab>`   |
|                                   | `<leader>bh`    | previously opened editor History       |             |
| navigate buffer                   | `[b`            | view: open previous editor             | `<C-PgUp>`  |
| move buffer                       | `[B`            | move editor left                       | `<CS-PgUp>` |
|                                   | `<leader>b1`    | Navigate buffer based on order         |             |
| swap buffer to left (smart split) | `g<leader>h`    | move editor into left group            | `<CS-h>`    |

## window mapping

| neovim             |               | vscode                             |     |
| ------------------ | ------------- | ---------------------------------- | --- |
| split window right | `<leader>w\|` | split editor                       |     |
| split window right | `<leader>\| ` | split editor                       |     |
| split window below | `<leader>w- ` | split editor down                  |     |
| split window below | `<leader>- `  | split editor down                  |     |
| close window       | `<leader>wd ` | close editor group                 |     |
| resize window      | `<leader>w= ` | view: reset editor group sizes     |     |
|                    | `<leader>w+ ` | view: toggle editor group sizes    |     |
| maximize toggle    | `<leader>wm ` | view: toggle maximize editor group |     |

## telescope mapping

| neovim                       |              | vscode                        |                        |
| ---------------------------- | ------------ | ----------------------------- | ---------------------- |
| explorer neo-tree (root dir) | `<leader>e`  | view: show explorer           | `<CS-e>`               |
| explorer neo-tree (root dir) | `<leader>fe` | view: show explorer           | `<CS-e>`               |
|                              | `<leader>fo` | open file                     |                        |
|                              | `<leader>fO` | open folder                   |                        |
| find files                   | `<leader>ff` | go to file...                 | `<C-e>` / `<A-o>`      |
| recent                       | `<leader>fr` | open recent                   | `<C-r>` / `<C-w><C-r>` |
| buffers, switch buffer       | `<leader>fb` | show all editor by appearance |                        |
| buffers, switch buffer       | `<leader>,`  | show all editor by appearance |                        |
| buffers                      | `<leader>sb` | find                          | `<C-f>`                |
| word (root dir)              | `<leader>sw` | find with selection           |                        |
| grep (root dir)              | `<leader>sg` | search: find in files         | `<CS-f>`               |
| replace in files (spectre)   | `<leader>sr` | search: replace in files      | `<CS-h>`               |
| goto symbol                  | `<leader>ss` | go to symbol in editor        | `<CS-o>`               |
| goto symbol (workspace)      | `<leader>sS` | go to symbol in workspace     |                        |

## LSP mapping

| neovim                   |              | vscode                                    |               |
| ------------------------ | ------------ | ----------------------------------------- | ------------- |
| diagnostics (trouble)    | `<leader>xx` | view: toggle problems                     | `<CS-m>`      |
| todo/fix/fixme (trouble) | `<leader>xT` | view: show TODOs                          |               |
|                          | `<leader>xr` | references: find all references           |               |
| next/prev diagnostic     | `[d`         | go to next/prev error or warning in files | `<F8>/<S-F8>` |
|                          | `[D`         | go to next/prev error or warning          |               |
| next/prev todo comment   | `[t`         | todo tree: go to next/prev                |               |
| goto definition          | `gd`         | go to definition                          | `<F12>`       |
| goto implementation      | `gI`         | go to implementation                      | `<C-F12>`     |
| goto type definition     | `gy`         | go to type definition                     |               |
| goto declaration         | `gD`         | go to declaration                         |               |
| go to reference          | `gr`         | go to reference                           | `<S-F12>`     |
|                          | `gpd`        | peek definition                           |               |
|                          | `gpI`        | peek implementation                       |               |
|                          | `gpy`        | peek type definition                      |               |
|                          | `gpD`        | peek declaration                          |               |
|                          | `gpr`        | search reference                          |               |
| symbols (trouble)        | `<leader>cs` | focus and select breadcrumbs              | `<CS-.>`      |
| code action              | `<leader>ca` | quick fix...                              | `<C-.>`       |
| run codelens             | `<leader>cc` | show code lens command for current line   |               |
| rename                   | `<leader>cr` | rename symbol                             | `<F2>`        |

## DAP mapping

| neovim                  |              | vscode                             |           |
| ----------------------- | ------------ | ---------------------------------- | --------- |
| Dap UI                  | `<leader>du` | view: toggle run and debug         | `<CS-d>`  |
| toggle REPL             | `<leader>dr` | view: toggle debug console         | `<CS-y>`  |
| session                 | `<leader>ds` | debug: select debug session        |           |
| +debug                  | `<leader>d`  | debug: start debugging             | `<F5>`    |
| toggle breakpoint       | `<leader>db` | debug: toggle breakpoint           | `<F9>`    |
|                         | `<leader>dB` | debug: toggle inline breakpoint    | `<S-F9>`  |
| run to cursor           | `<leader>dC` | debug: run to cursor               |           |
| go to line (no execute) | `<leader>dg` | debug: start without debugging     | `<C-F5>`  |
| continue                | `<leader>dc` | debug: continue                    | `<F5>`    |
| pause                   | `<leader>dp` | debug: pause                       | `<F6>`    |
| terminate               | `<leader>dt` | debug: stop                        | `<s-F5>`  |
| down                    | `<leader>dj` | debug: navigate down call stack    |           |
| up                      | `<leader>dk` | debug: navigate up call stack      |           |
| step into               | `<leader>di` | debug: step into                   | `<F11>`   |
| step out                | `<leader>do` | debug: step out                    | `<S-F11>` |
| step over               | `<leader>dO` | debug: step over                   | `<F10>`   |
| +test                   | `<leader>t`  | view: show testing                 |           |
| show output             | `<leader>to` | test: peek output                  |           |
| toggle output panel     | `<leader>tO` | test: show output                  |           |
| toggle watch            | `<leader>tW` | run and debug: focus on watch view |           |
|                         | `<leader>tw` | debug: add to watch                |           |
| debug nearest           | `<leader>td` | test: debug tests at cursor        |           |
| run nearest             | `<leader>tr` | test: run tests at cursor          |           |
| run last                | `<leader>tl` | test: rerun last run               |           |
| run file                | `<leader>tt` | test: run tests in current file    |           |
| run all test files      | `<leader>tT` | test: run all tests                |           |
| stop                    | `<leader>tS` | test: stop continuous run          |           |

---

## plugin

### mini surround

- gsa: Add Surrounding
- gsd: Delete Surrounding
- gsf: Find Right Surrounding
- gsF: Find Left Surrounding
- gsh: Highlight Surrounding
- gsn: Update MiniSurround.config.n_lines
- gsr: Replace Surrounding

### text object

#### custom text object [mini.ai]

- o: code block (block, conditional, loop)
- a: param
- i: call (invoke)
- f: function
- c: class

#### regex [mini.ai]

- t: tags
- d: digits
- e: word with case

#### swap

- next: <leader>na (param), <leader>nr (prop), <leader>nf (func)
- prev: <leader>pa (param), <leader>pr (prop), <leader>pf (func)

#### move

- next start: `]a` (param), `]i` (call), `]f` (func), `]c` (class), `]r` (prop)
- next end: `]A` (param), `]I` (call), `]F` (func), `]C` (class), `]R` (prop)
- prev start: `[a` (param), `[i` (call), `[f` (func), `[c` (class), `[r` (prop)
- prev end: `[A` (param), `[I` (call), `[F` (func), `[C` (class), `[R` (prop)

---

## Reference

- ref: https://github.com/vscode-neovim/vscode-neovim/issues/1717
- ref: https://github.com/vscode-neovim/vscode-neovim/discussions/1614#discussioncomment-7576629

---

## Example: Basic

```lua
vim.cmd([[nnoremap <silent> <space> <cmd>lua require('vscode-neovim').call('workbench.action.nextEditor')<cr>]])
```

```lua
nnoremap: "n", <silent>: { silent = true }, <cmd> lua code <cr>: function() lua code end
```

---

## Example: vscode.with_insert

> Perform operations in insert mode. If in visual mode, this function will preserve the selection after switching to insert mode.

- make `addSelectionToNextFindMatch` work correctly in any mode (<A-d>)

```lua
map({ "n", "x", "i" }, "<A-d>", function()
  vscode.with_insert(function() vscode.action("editor.action.addSelectionToNextFindMatch") end)
end)
```

- make "editor.action.refactor" work correctly on the selection and support snippet manipulation after entering VSCode snippet mode.

```lua
map({ "n", "x" }, "<leader>r", function()
  vscode.with_insert(function() vscode.action("editor.action.refactor") end)
end)
```

---

## Code Snippet

```lua
local vscode = require("vscode-neovim") -- oldname
local vscode = require("vscode")
local map = vim.keymap.set
```

---
