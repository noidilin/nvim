# Read me

## Setup

> [!note]
> config is installed at the XDG directory.

- create a symlink at '$env.LOCALAPPDATA\nvim' for vscode-neovim, since it only check the default installation path.

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
