# Neovim Config

A modern, developer-focused Neovim setup powered by **lazy.nvim**, designed for fast navigation, clean UI, strong Git workflow, and practical language tooling (TypeScript/JavaScript, Java, Flutter/Dart, Markdown).

This configuration uses:

- **Space** as the leader key
- **lazy.nvim** for plugin management
- **VS Code-inspired** visuals with transparent background
- Integrated **LSP, completion, formatting, linting, git tooling, telescope search, file explorer, and AI chat**

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Repository Structure](#repository-structure)
- [Keymaps (Quick Start)](#keymaps-quick-start)
- [Language Tooling](#language-tooling)
- [Plugin Overview](#plugin-overview)
- [Troubleshooting](#troubleshooting)
- [Customization Tips](#customization-tips)
- [Related Docs](#related-docs)

---

## Features

### Core Editing Defaults

- True color enabled (`termguicolors`)
- Relative + absolute line numbers
- 2-space indentation with tabs expanded to spaces
- Smart search (`ignorecase` + `smartcase`)
- System clipboard integration via `unnamedplus`

### Navigation & Search

- **Neo-tree** file explorer with git and diagnostics status
- **Telescope** for files, text grep, buffers, and help tags
- **vim-tmux-navigator** integration for seamless pane movement

### Git Workflow

- **gitsigns.nvim** for hunk-level workflows inside buffers
- **lazygit.nvim** for full terminal Git UI from inside Neovim

### Code Intelligence

- **mason.nvim + nvim-lspconfig** for LSP server management
- Configured LSP installs: `ts_ls`, `eslint`, `jdtls`
- Rounded diagnostic UI, hover docs, and diagnostics toggle

### Completion, Formatting & Linting

- **nvim-cmp** + LuaSnip + LSP/buffer/path completion sources
- **conform.nvim** formatting on save for TS/JS/JSON (Prettier)
- **nvim-lint** lint-on-save and on insert-leave (ESLint for JS/TS)

### Language/Workflow Extras

- Java: `nvim-jdtls` autostarts through `ftplugin/java.lua`
- Flutter: `flutter-tools.nvim` with debugger, widget guides, dev log
- Markdown: `render-markdown.nvim` toggle support per buffer
- Focus mode: `zen-mode.nvim`
- AI/chat panel: `opencode.nvim`

---

## Requirements

### Required

- **Neovim 0.11+** (this config uses the newer `vim.lsp.config` / `vim.lsp.enable` API)
- `git`
- A Nerd Font (for file/completion icons)

### Strongly Recommended

- `make` + C toolchain (for `telescope-fzf-native.nvim`)
- `lazygit` (for `<leader>g*` LazyGit mappings)
- `eslint` and `prettier` available in your project(s) for lint/format workflows

### Optional (language-specific)

- Java toolchain + project (`mvnw`, `gradlew`, or `.git` root) for `jdtls`
- Flutter SDK for `flutter-tools.nvim`
- tmux for navigator integration

---

## Installation

> Back up any existing Neovim config first.

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
git clone https://github.com/Tendwa-T/nvim-config.git ~/.config/nvim
nvim
```

On first launch, `lazy.nvim` bootstraps automatically and installs plugins.

If needed after startup:

- `:Lazy` — open plugin manager UI
- `:Lazy sync` — install/update plugins
- `:checkhealth` — run Neovim health checks

---

## Repository Structure

```text
.
├── init.lua                  # Entry point
├── lua
│   ├── config
│   │   ├── options.lua       # Core Neovim options and leader key
│   │   └── lazy.lua          # lazy.nvim bootstrap + plugin loading
│   └── plugins               # Plugin specs and plugin config
│       ├── lsp.lua
│       ├── cmp.lua
│       ├── formatting.lua
│       ├── lint.lua
│       ├── neotree.lua
│       ├── telescope.lua
│       ├── gitsigns.lua
│       ├── lazygit.lua
│       ├── treesitter.lua
│       ├── java.lua
│       ├── flutter.lua
│       ├── markdown.lua
│       ├── zen.lua
│       ├── whichkey.lua
│       └── ...
├── ftplugin
│   └── java.lua              # jdtls start/attach config
├── lazy-lock.json            # Pinned plugin commits
└── CHEATSHEET.md             # Expanded usage cheatsheet
```

---

## Keymaps (Quick Start)

Leader = `Space`

### Files & Search

- `<leader>e` — Toggle Neo-tree
- `<leader>E` — Focus Neo-tree on current file
- `<leader>ff` — Find files
- `<leader>fg` — Live grep
- `<leader>fb` — Buffers
- `<leader>fh` — Help tags

### Git

- `]c` / `[c` — Next/previous hunk
- `<leader>hs` — Stage hunk
- `<leader>hr` — Reset hunk
- `<leader>hp` — Preview hunk
- `<leader>hb` — Blame line
- `<leader>gs` — Open LazyGit
- `<leader>gP` — LazyGit current file
- `<leader>gl` — LazyGit log

### Lint/Format

- `<leader>lf` — Format buffer
- `<leader>li` — Formatter info
- `<leader>ll` — Lint buffer

### Diagnostics & LSP

- `gl` — Diagnostic float
- `[d` / `]d` — Prev/next diagnostic
- `K` — Hover docs
- `<leader>td` — Toggle diagnostics (current buffer)

### Completion

- `<C-Space>` — Trigger completion
- `<C-j>` / `<C-k>` — Next/previous completion item
- `<CR>` — Confirm completion
- `<Tab>` — Next completion/snippet jump

### Extras

- `<leader>mt` — Toggle Markdown render
- `og` — Toggle OpenCode chat panel
- `oo` — Focus OpenCode output
- `o/` — Quick chat (normal/visual)
- `:ZenMode` — Toggle distraction-free mode

---

## Language Tooling

### TypeScript / JavaScript / JSON

- Formatting: `prettier` (on save via Conform)
- Linting: `eslint` (on save and insert leave via nvim-lint)
- LSP: `ts_ls` installed via Mason

### Java

- `jdtls` ensured by Mason
- `ftplugin/java.lua` starts/attaches `jdtls`
- Root detection via `.git`, `mvnw`, or `gradlew`

### Flutter / Dart

- `flutter-tools.nvim` enabled
- Debugger integration and widget guides available

### Markdown

- `render-markdown.nvim` enabled for markdown buffers
- Use `<leader>mt` for buffer toggle

---

## Plugin Overview

Main plugins configured in this repo:

- `folke/lazy.nvim`
- `nvim-neo-tree/neo-tree.nvim`
- `nvim-telescope/telescope.nvim` (+ `telescope-fzf-native.nvim`)
- `neovim/nvim-lspconfig`
- `williamboman/mason.nvim`
- `hrsh7th/nvim-cmp`
- `stevearc/conform.nvim`
- `mfussenegger/nvim-lint`
- `lewis6991/gitsigns.nvim`
- `kdheepak/lazygit.nvim`
- `nvim-treesitter/nvim-treesitter`
- `Mofiqul/vscode.nvim`
- `folke/which-key.nvim`
- `folke/zen-mode.nvim`
- `akinsho/flutter-tools.nvim`
- `mfussenegger/nvim-jdtls`
- `MeanderingProgrammer/render-markdown.nvim`
- `sudo-tee/opencode.nvim`

Pinned revisions are tracked in `lazy-lock.json`.

---

## Troubleshooting

- **Neovim command not found**: install Neovim 0.11+ and ensure it is on `PATH`.
- **Missing icons**: install/select a Nerd Font in your terminal.
- **Formatting/linting not triggering**: verify `prettier`/`eslint` are installed in the current project.
- **LazyGit mappings fail**: install `lazygit`.
- **Telescope FZF extension not available**: ensure `make` and a C compiler are installed, then run `:Lazy sync`.
- **Java LSP not attaching**: open file inside a project containing `.git`, `mvnw`, or `gradlew`.

---

## Customization Tips

- Edit `lua/config/options.lua` for editor defaults.
- Add/remove plugins in `lua/plugins/*.lua`.
- Keep plugin versions stable with `lazy-lock.json`.
- Use `CHEATSHEET.md` as your day-to-day command reference.

---

## Related Docs

- **CHEATSHEET**: [`CHEATSHEET.md`](./CHEATSHEET.md)

