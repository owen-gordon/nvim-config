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

The version of Neovim in the default apt repos is usually too old (< 0.10). Use one of these:

```sh
# Tooling (always needed)
sudo apt install -y git build-essential ripgrep fd-find nodejs npm

# Option A: official PPA (stable releases)
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update && sudo apt install -y neovim

# Option B: AppImage (no root, latest stable)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

# Option C: prebuilt tarball
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

Note: on Debian/Ubuntu, `fd` is installed as `fdfind`. Symlink it so telescope can find it:

```sh
mkdir -p ~/.local/bin && ln -sf "$(which fdfind)" ~/.local/bin/fd
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

### Core (VS Code–style)

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

### VS Code–style shortcuts (Telescope + neo-tree)

If you're coming from VS Code, these will feel familiar:

| VS Code                  | This config         | Action                                  |
| ------------------------ | ------------------- | --------------------------------------- |
| `Ctrl+P` (Quick Open)    | `<C-p>`             | Find file by name                       |
| `Ctrl+Shift+F` (Search)  | `<leader>fg`        | Live grep across the project            |
| `Ctrl+T` (Go to symbol)  | `<leader>fd`        | Workspace diagnostics (closest analog)  |
| `Ctrl+B` (Toggle sidebar)| `<C-b>` / `<leader>e` | Toggle neo-tree file explorer         |
| `Ctrl+Shift+P` (Command palette) | `:`         | Neovim command line (built-in)          |
| `Ctrl+`` ` `` (Terminal) | `:terminal` / `:te` | Open a terminal buffer                  |
| `Ctrl+Tab` (Buffer list) | `<leader>fb`        | Pick from open buffers                  |

> Note: Neovim's "command palette" is the built-in command line — just press `:` and start typing. Tab-completes commands.

Inside Telescope pickers: `<C-j>`/`<C-k>` move down/up, `<CR>` opens, `<C-v>`/`<C-x>` open in vertical/horizontal split, `<C-t>` opens in a new tab, `<Esc>` closes.

Inside neo-tree: `a` add file, `d` delete, `r` rename, `c` copy, `x` cut, `p` paste, `?` show all keys.

### LSP

LSP keymaps activate automatically when a language server attaches to the buffer. Install servers with `:Mason` (Pyright is pre-installed via `mason-lspconfig`).

| Key            | Action                            |
| -------------- | --------------------------------- |
| `K`            | Hover docs (VS Code: hover popup) |
| `gd` / `<F12>` | Go to definition                  |
| `gD`           | Go to declaration                 |
| `gr`           | Find references                   |
| `gi`           | Go to implementation              |
| `<F2>` / `<leader>rn` | Rename symbol              |
| `<leader>ca`   | Code action (VS Code: `Ctrl+.`)   |
| `<leader>d`    | Show diagnostic at cursor         |
| `[d` / `]d`    | Previous / next diagnostic        |
| `<C-k>` (insert mode) | Signature help             |

### Completion (nvim-cmp, insert mode)

| Key            | Action                            |
| -------------- | --------------------------------- |
| `<C-Space>`    | Trigger completion menu           |
| `<Tab>` / `<S-Tab>` | Next / previous item, or jump snippet |
| `<CR>`         | Confirm selection                 |
| `<C-e>`        | Abort                             |

### Quick tips

- First launch: lazy.nvim installs plugins automatically. Restart `nvim` once it finishes.
- Run `:Mason` to install / manage LSP servers, formatters, linters.
- Run `:checkhealth` to diagnose missing dependencies (rg, fd, node, compiler, etc.).
- Run `:Lazy` for the plugin manager UI (`U` to update, `S` to sync).

## License

MIT
