# vDotAstron

<!--**NOTE:** This is for AstroNvim v5+-->

My template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim) for Termux and PC.
> [!NOTE]
> Updated to AstroNvim v5+ for Neovim v0.10 ^latest.
>
> This template has some patches fixes for Termux and some other features.

## Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

## 🛠️ Installation

### Packages required for Termux

Run the following command to install the necessary packages in Termux:

```bash
apt update && apt upgrade
apt install termux-api python neovim git nodejs-lts fd ripgrep ruff rust stylua luarocks lua-language-server fzf clang termux-tools lazygit
```

[Get more details](https://docs.astronvim.com/)

> [!TIP]
> To get clipboards from vim to the device.
> You need to install [Termux:API]() for Termux.
> But not required for **Termux googleplay**.

### Clone the repository
**UNIX/LINUX**
```bash
git clone https://github.com/Veha0001/vDotAstron ~/.config/nvim
```
**WINDOWS**
```shell
git clone https://github.com/Veha0001/vDotAstron $ENV:LOCALAPPDATA/nvim
```
### Then you start nvim.
You need a good network to clone a loot of plugins at the time.
Else it would stop or exit(1).
## Thank You!.
