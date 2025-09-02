# Read me

## Setup

> [!note]
> config is installed at the XDG directory.

- create a symlink at '$env.LOCALAPPDATA\nvim' for vscode-neovim, since it only check the default installation path.

## Snippet

- engine: [blink.cmp](https://github.com/saghen/blink.cmp)
- snippet:
  - react: [simple-react-snippets](https://github.com/burkeholland/simple-react-snippets/tree/master)
  - arrow function: [vscode-arrow-snippets](https://github.com/deinsoftware/vscode-arrow-snippets/tree/main)

## Theme customization

This configuration is customized with my own theme color-fatigue, which powered by the lush plugin.

- `lua\plugins\lush.lua` loads lush function, and my custom theme directory `lua\theme\`
- load custom theme: `lua\theme\colors\color-fatigue.lua` is loaded
  - theme is named after `vim.g.colors_name = "color-fatigue"`
  - theme setup is passed to lush to apply with `require("lush")(require("lush_theme.init"))`
- theme setup: `lua\theme\lua\lush_theme\init.lua` is the entry point of my theme.
  - design token level 1: `_primitive.lua` (color palette)
  - design token level 2: `_semantic.lua` (syntax)
  - design token level 3: `_component.lua` (UI group)

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
