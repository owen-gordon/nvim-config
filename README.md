# nvim-config

My personal Neovim configuration, built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Features

- **Plugin manager:** lazy.nvim (auto-bootstraps on first launch)
- **Colorscheme:** catppuccin
- **LSP:** mason + mason-lspconfig + nvim-lspconfig
- **Completion:** nvim-cmp + LuaSnip
- **Fuzzy finder:** telescope.nvim
- **File explorer:** neo-tree.nvim
- **Syntax:** nvim-treesitter
- **Dashboard:** alpha-nvim
- **AI:** avante.nvim

## Requirements

- **Neovim** ≥ 0.10 (0.11+ recommended)
- **git**
- **make**, a C compiler (`gcc`/`clang`) — for treesitter parsers and `avante.nvim`'s build step
- **ripgrep** (`rg`) and **fd** — for telescope live-grep and file finding
- **A [Nerd Font](https://www.nerdfonts.com/)** — for icons (set your terminal font to one)
- **Node.js** — required by some LSP servers installed via mason

### Install dependencies

**macOS (Homebrew):**

```sh
brew install neovim git ripgrep fd node
```

**Ubuntu/Debian:**

```sh
sudo apt install -y git build-essential ripgrep fd-find nodejs npm
# Neovim: use the stable PPA or download the AppImage from neovim.io
```

**Arch:**

```sh
sudo pacman -S neovim git ripgrep fd nodejs base-devel
```

## Install

Back up any existing config first:

```sh
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null
```

Clone:

```sh
git clone https://github.com/owen-gordon/nvim-config.git ~/.config/nvim
```

Launch:

```sh
nvim
```

lazy.nvim will bootstrap itself and install all plugins on first run. Then run `:Mason` to install LSP servers as needed.

## Layout

```
~/.config/nvim/
├── init.lua              -- options, keymaps, lazy bootstrap
├── lazy-lock.json        -- pinned plugin versions
└── lua/plugins/
    ├── ai.lua            -- avante.nvim
    ├── completion.lua    -- nvim-cmp
    ├── dashboard.lua     -- alpha-nvim
    ├── editor.lua        -- colorscheme, statusline, etc.
    ├── explorer.lua      -- neo-tree
    ├── lsp.lua           -- mason, lspconfig
    ├── telescope.lua     -- telescope
    └── treesitter.lua    -- nvim-treesitter
```

## Keymaps

Leader is `<Space>`.

| Key            | Action                       |
| -------------- | ---------------------------- |
| `<C-s>`        | Save                         |
| `<C-z>`/`<C-y>`| Undo / Redo                  |
| `<C-a>`        | Select all                   |
| `<C-h/j/k/l>`  | Move between windows         |
| `<A-j>`/`<A-k>`| Move line down / up          |
| `<S-h>`/`<S-l>`| Previous / next buffer       |
| `<leader>x`    | Close buffer                 |
| `<Esc>`        | Clear search highlight       |

See plugin files for plugin-specific bindings.

## License

MIT
