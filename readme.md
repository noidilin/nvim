# Read me

> [!note]
> config is installed at the XDG based directory.

## VSCode neovim

There is a sub-configuration for vscode, located in `lua\noidilin\`.

- lazyvim alike keymap: `lua\noidilin\vs-keymap`
- lazyvim alike plugin: `lua\noidilin\vs-env`

> [!warning]
> Symlink at '$env.LOCALAPPDATA\nvim' for vscode-neovim, since it only check the default installation path.

## Theme customization

This configuration is customized with my own theme 'achroma', which powered by the lush plugin.

- `lua\plugins\lush.lua` loads lush function, and my custom theme directory `lua\theme\`
- load custom theme: `lua\theme\colors\achroma.lua` is loaded
  - theme is named after `vim.g.colors_name = "achroma"`
  - theme setup is passed to lush to apply with `require("lush")(require("lush_theme.init"))`
- theme setup: `lua\theme\lua\lush_theme\init.lua` is the entry point of my theme.
  - design token level 1: `_primitive.lua` (color palette)
  - design token level 2: `_semantic.lua` (syntax)
  - design token level 3: `_component.lua` (UI group)
  - core features: `lua\theme\lua\lush_core\`
  - plugin: `lua\theme\lua\lush_plugin\`
  - deprecated plugin: `lua\theme\lua\lush_stale\`

> [!note] directories naming starting with `lush_`
> Due to the poor path resolution in lua, the name of directories should avoid collapsing with names under the root `lua`.

> [!note] naming in lazyvim
>
> - plugin name: `theme` (based on the directory name)
> - colorscheme name: `achroma` (based on `vim.g.colors_name` in `lua\theme\colors\achroma.lua`)
>   Note that custom theme file needs to be named after the name of the colorscheme.

## Snippet

- engine: [blink.cmp](https://github.com/saghen/blink.cmp)
- snippet:
  - react: [simple-react-snippets](https://github.com/burkeholland/simple-react-snippets/tree/master)
  - arrow function: [vscode-arrow-snippets](https://github.com/deinsoftware/vscode-arrow-snippets/tree/main)

## Known issue

### fix `main.shada.tmp.X  files exist, cannot write ShaDa` issue

Remove files in shada directory fixes the issue.

```nu
ls ($env.LOCALAPPDATA | path join 'nvim-data' 'shada' ) | get name | each {|file| rm -fv $file}
```

1. `$env.LOCALAPPDATA | path join 'nvim-data' 'shada'`: construct the path.
2. `ls ($constructed_path)`: list all files and directories as a structured table
3. `get name`: extract just the file names
4. `each {...}` loops through each file path.

- `rm -fv $file`: delete each file (`-f`: force, `-v`: verbose)

I use this method due to wildcard (`*`) character not expanding properly, and `ls` naturally gets all files, eliminating the need for `*`. Then `each` ensures that `rm` processes each file separately.
