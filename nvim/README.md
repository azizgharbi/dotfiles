# Neovim configuration

Based on lunarVim, I made my own configuration:

`rust` `lua` `typescript` `javascript` `go` `vuejs` lsp simple configs.

## Try out this config

Based on this repository:
```
https://github.com/LunarVim/Neovim-from-scratch
```
Run `nvim` and wait for the plugins to be installed
**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)
## Get healthy

Open `nvim` and enter the following:

 ```
 :checkhealth
 ```
First we'll fix copy/paste

- On Arch Linux
 ```
 sudo pacman -S xsel
 ```

- Regex 
 ```
 sudo pacman -S ripgrep ripgrep-all
 ```

- LSP for javascript and typescript
 ```
 sudo npm i -g typescript-language-server typescript-language-server
 ```

- LSP for vue (framework)
 ```
 sudo npm -i -g vls
 ```
 
- LSP for lua
 ```
 visit : https://github.com/sumneko/lua-language-server/wiki/Getting-Started
 ```

- LSP for php (phpactor)
 ```
 https://phpactor.readthedocs.io/en/master/usage/standalone.html
 ```

- LSP for Go (gopls)
 ```
 sudo pacman -S gopls
 ```

 - Custom commands are defined in `src/custom-commands.lua`


