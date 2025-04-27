# DotAstroNvim

<!--**NOTE:** This is for AstroNvim v4+-->

My template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim) for Termux and PC.
> [!NOTE]
> This is for AstroNvim v4+ for nvim `v0.10^`.
>
> Update to AstroNvim v5+ is unstable right now.

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Install Required Packages 

Run the following command to install the necessary packages in Termux:

```bash
apt update && apt upgrade
apt install termux-api python neovim git nodejs-lts fd ripgrep ruff stylua luarocks lua-language-server yarn fzf clang termux-tools lazygit
```

[Get more details](https://docs.astronvim.com/)
 
### Termux clipboards

For get clipboards from vim to the device.

> Install packages: `apt install termux-api`.
> Then install Termux:API app from **Github** or **F-Dorid**.

> [!NOTE]
> No need to install **Termux:API** for **Termux Play Store**.

## Clone the repository
**UNIX/LINUX**
```bash
git clone https://github.com/Veha0001/dotAstroNvim ~/.config/nvim
```
**WINDOWS**
```cmd
git clone https://github.com/Veha0001/dotAstroNvim $ENV:LOCALAPPDATA/nvim
```
then start `nvim`.
