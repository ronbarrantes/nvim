# My NeoVim configs

for this to work packer is required to be installed

Go to the [WBThomason's Packer](https://github.com/wbthomason/packer.nvim) for mor packer info

### For Unix, Linux

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### For Window Powershell

```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

## Next

- Go to the Packer file using vim

do `:so` for to source the file

then do `:PackerInstall` to install the plugins

## When updating the plugins

do `:PackerSync` to sync and update the plugins

## Plugins

### Mason

use `:Mason` to add languages
