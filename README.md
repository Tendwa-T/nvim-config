# Neovim Config

A modern, developer-focused Neovim setup powered by **lazy.nvim**, tuned for JavaScript/TypeScript, Dart/Flutter, and Java Spring Boot.

This configuration uses:

- **Space** as the leader key
- **snacks.nvim** for picker, file explorer, notifications, LazyGit float, statuscolumn, quickfile, and reference words
- **blink.cmp** for fast completion
- **mason.nvim + nvim-lspconfig** for TypeScript, ESLint, and Java tooling
- **flutter-tools.nvim** for Dart/Flutter LSP, run/debug, devices, logs, and hot reload
- **nvim-jdtls + nvim-dap** for Java navigation, refactors, tests, and debugging
- **VS Code-inspired** visuals with transparent background

## Requirements

- Neovim `0.12+`
- `git`
- A Nerd Font
- `lazygit` for the LazyGit float
- Project-local or Mason-installed `prettier` and `eslint_d` for JS/TS formatting and linting
- Java toolchain for `jdtls`
- Flutter SDK for Flutter/Dart development
- tmux if you use the tmux navigator mappings

## Installation

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
git clone https://github.com/Tendwa-T/nvim-config.git ~/.config/nvim
nvim
```

On first launch, `lazy.nvim` bootstraps and installs plugins. Useful maintenance commands:

- `:Lazy` - Plugin manager UI
- `:Lazy sync` - Install/update plugins
- `:Mason` - LSP/tool installer UI
- `:checkhealth` - Health checks

## Structure

```text
.
├── init.lua
├── lua
│   ├── config
│   │   ├── options.lua
│   │   └── lazy.lua
│   └── plugins
│       ├── blink.lua
│       ├── coding.lua
│       ├── dap.lua
│       ├── flutter.lua
│       ├── formatting.lua
│       ├── java.lua
│       ├── lint.lua
│       ├── lsp.lua
│       ├── snacks.lua
│       ├── trouble.lua
│       └── ...
├── ftplugin/java.lua
├── lazy-lock.json
├── CHEATSHEET.md
└── NVIM_MENTAL_MODEL.md
```

## Quick Start

- `Space ff` - Find files
- `Space fg` - Live grep
- `Space fw` - Grep word/selection
- `Space e` - Snacks explorer
- `Space E` - Reveal current file
- `Space gs` - LazyGit
- `Space xx` - Trouble diagnostics
- `Space lf` - Format buffer
- `Space ll` - Lint buffer
- `Space la` - Code action
- `Space lr` - Rename symbol
- `Space db` - Toggle breakpoint
- `Space Fr` - Flutter run
- `Space FR` - Flutter hot reload
- `Space jo` - Java organize imports
- `Space jt` - Java test nearest method
- `og` - OpenCode chat

See [`CHEATSHEET.md`](./CHEATSHEET.md) for the full command map and [`NVIM_MENTAL_MODEL.md`](./NVIM_MENTAL_MODEL.md) for concepts, habits, and learning notes.

## Language Tooling

### JavaScript / TypeScript

- `ts_ls` for TypeScript/JavaScript LSP
- `eslint` LSP plus `eslint_d` linting
- Prettier formatting for JS, TS, React, JSON, CSS, SCSS, HTML, YAML, Markdown, and GraphQL
- Snacks pickers for files, symbols, diagnostics, references, and package lookup

### Dart / Flutter

- `flutter-tools.nvim` owns Dart LSP startup
- Flutter run/debug, devices, emulators, logs, outline, reanalyze, hot reload, hot restart
- `nvim-dap` integration for debug sessions
- Dart formatting through LSP fallback

### Java / Spring Boot

- `nvim-jdtls` starts from `ftplugin/java.lua`
- Mason-resolved `jdtls`, Java debug adapter, and Java test bundles
- Per-project JDTLS workspaces
- Organize imports, extract variable/method, test class/method, update project config
- Spring Boot validation settings where supported by the underlying Java language server

## Main Plugins

- `folke/snacks.nvim`
- `saghen/blink.cmp`
- `folke/trouble.nvim`
- `folke/todo-comments.nvim`
- `windwp/nvim-autopairs`
- `kylechui/nvim-surround`
- `neovim/nvim-lspconfig`
- `williamboman/mason.nvim`
- `WhoIsSethDaniel/mason-tool-installer.nvim`
- `stevearc/conform.nvim`
- `mfussenegger/nvim-lint`
- `mfussenegger/nvim-dap`
- `rcarriga/nvim-dap-ui`
- `mfussenegger/nvim-jdtls`
- `nvim-flutter/flutter-tools.nvim`
- `lewis6991/gitsigns.nvim`
- `nvim-treesitter/nvim-treesitter`
- `folke/which-key.nvim`
- `Mofiqul/vscode.nvim`
- `sudo-tee/opencode.nvim`

Pinned revisions live in `lazy-lock.json`.

## Troubleshooting

- Missing icons: select a Nerd Font in your terminal.
- LazyGit key fails: install `lazygit`.
- JS/TS formatting or linting fails: check `:ConformInfo`, `Space ll`, and project dependencies.
- Java LSP not attaching: open a file under `mvnw`, `gradlew`, `pom.xml`, `build.gradle`, or `.git`.
- Flutter LSP duplicated: do not configure `dartls` separately; Flutter Tools manages it.
