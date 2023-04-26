# nvim-config

First we need Packer, we need to clone its data:


> Unix, Linux Installation

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

If you use Arch Linux, there is also [an AUR
package](https://aur.archlinux.org/packages/nvim-packer-git/).

> Windows Powershell Installation

```shell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

Then navigate to init.lua inside of /nvim and run `:so` and it should allow you to use 
```shell
:PackerSync
```
which will install packages. Close nvim and reopen it and most of things will start to work.
