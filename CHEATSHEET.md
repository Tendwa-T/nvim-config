# Neovim Cheatsheet

This config is built around `Space` as the leader key.

## Basics

- `Space` is the leader key.
- Line numbers are enabled, with relative numbers for quick jumps.
- Indentation is 2 spaces, with tabs converted to spaces.
- Clipboard is synced with macOS using `unnamedplus`.
- Search is case-insensitive by default, but becomes case-sensitive if you type a capital letter.

## Tmux and Tmuxinator

Your tmux prefix key is `Ctrl+a`.

Common tmux usage:

- `Ctrl+a c` - Create a new window
- `Ctrl+a n` - Go to next window
- `Ctrl+a p` - Go to previous window
- `Ctrl+a ,` - Rename current window
- `Ctrl+a %` - Split pane left/right (tmux default)
- `Ctrl+a "` - Split pane top/bottom (tmux default)
- `Ctrl+a |` - Split pane left/right in current path (custom)
- `Ctrl+a -` - Split pane top/bottom in current path (custom)
- `Ctrl+a x` - Kill current pane
- `Ctrl+a d` - Detach from session
- `Ctrl+a C-a` - Send prefix to nested tmux session

Pane navigation (works with smart Neovim awareness):

- `Ctrl+h` - Move to left pane (or Neovim split)
- `Ctrl+j` - Move to lower pane (or Neovim split)
- `Ctrl+k` - Move to upper pane (or Neovim split)
- `Ctrl+l` - Move to right pane (or Neovim split)

Quality-of-life behavior from your config:

- Mouse is enabled for pane selection and resizing
- Windows and panes start at index `1` instead of `0`

Tmuxinator fullstack workflow:

- Start session: `tmuxinator start fullstack`
- The project root opens at `~/Dev/code/e-pol-dev`
- It creates one `development` window with `main-vertical` layout
- Pane 1 (left): `nvim`
- Pane 2 (top-right): `cd e-poultry-backend && pnpm run start:dev`
- Pane 3 (bottom-right): `cd e_poultry_mobile && flutter run`

Useful tmuxinator commands:

- `tmuxinator start fullstack` - Start and attach
- `tmuxinator stop fullstack` - Stop the session
- `tmuxinator edit fullstack` - Edit this project config

## File Explorer

Open the file tree with:

- `Space e` - Toggle Neo-tree
- `Space E` - Focus Neo-tree on the current file

Inside Neo-tree:

- `<Enter>` or `l` - Open file / expand folder
- `h` - Collapse folder / go up
- `a` - Create a file or folder
- `d` - Delete
- `r` - Rename
- `c` - Copy
- `m` - Move

Neo-tree also shows Git status and diagnostics when available.

## Git Workflow

This config now includes `gitsigns.nvim`, which shows Git changes directly in the editor.

In the sign column and current buffer, you can:

- See added, changed, and deleted lines
- Jump between Git hunks
- Stage or reset a hunk
- Stage the whole buffer
- Preview the current hunk
- Blame the current line
- Diff the current buffer against Git history

Git keymaps:

- `]c` - Next Git hunk
- `[c` - Previous Git hunk
- `Space hs` - Stage hunk
- `Space hr` - Reset hunk
- `Space hS` - Stage buffer
- `Space hu` - Undo stage hunk
- `Space hp` - Preview hunk
- `Space hb` - Blame line
- `Space hd` - Diff this buffer
- `Space hD` - Diff this buffer against HEAD

For a full Git UI, this config now also includes `LazyGit`.

- `Space gs` - Open LazyGit status UI
- `Space gp` - Open LazyGit status UI for pushing
- `Space gP` - Open LazyGit for the current file
- `Space gl` - Open Git log view
- `Space gf` - Filter commits for the whole repo
- `Space gF` - Filter commits for the current file
- `Space gc` - Open the LazyGit config file
- `Space gr` - Pick a repo with Telescope and open LazyGit there

From the LazyGit UI, you can stage, commit, push, pull, inspect diffs, and browse branches without leaving Neovim.

Tip: press `p` inside LazyGit to push.
Tip: `Space gr` opens the Telescope repo picker from the LazyGit extension.

## Search and Navigation

Telescope is the main search tool.

- `Space ff` - Find files
- `Space fg` - Live grep across the project
- `Space fb` - List open buffers
- `Space fh` - Search help tags

Telescope ignores common heavy folders like `node_modules`, `.git`, `.dart_tool`, `build`, `target`, and `.gradle`.

## Completion and Snippets

Completion opens automatically in Insert mode.

- `<C-Space>` - Ctrl+Space, manually trigger completion
- `<C-j>` - Next completion item
- `<C-k>` - Previous completion item
- `<C-f>` - Scroll documentation down
- `<C-b>` - Scroll documentation up
- `<C-e>` - Close completion menu
- `<Enter>` - Confirm selection
- `<Tab>` - Cycle completion items or jump through snippets

Completion sources include:

- LSP suggestions
- LuaSnip snippets
- Buffer words
- File paths

## Common Vim Bindings

Selection and highlighting:

- `v` - Start visual mode and highlight text by character
- `V` - Highlight whole lines
- `<C-v>` - Highlight by block / column
- `<Esc>` - Clear the current selection

Commenting:

- `gc{motion}` - Add or toggle a line comment over a motion or visual selection
- `gcc` - Toggle a comment on the current line
- `gb{motion}` - Add or toggle a block comment over a motion or visual selection
- `gbc` - Toggle a block comment on the current block

Basic editing:

- `yy` - Yank the current line
- `dd` - Delete the current line
- `cc` - Change the current line
- `jk` - Exit insert mode quickly
- `p` - Paste after the cursor or line
- `P` - Paste before the cursor or line
- `u` - Undo
- `<C-r>` - Redo

Line and text movement:

- `0` - Move to the start of the line
- `$` - Move to the end of the line
- `gg` - Jump to the top of the file
- `G` - Jump to the bottom of the file

Search and replace:

- `/text` - Search forward for text
- `n` - Jump to the next match
- `N` - Jump to the previous match
- `:%s/old/new/g` - Replace text in the whole file

Tip: in Vim, yanking is the same thing as copying.

## Formatting

Formatting is handled by Conform.

- TypeScript files format on save with Prettier
- JavaScript files format on save with Prettier
- JSON files format on save with Prettier
- `Space lf` - Format the current buffer now
- `:ConformInfo` - Show formatter information

## Linting

Linting is handled by `nvim-lint`.

- TypeScript files lint with ESLint
- JavaScript files lint with ESLint
- TypeScript React files lint with ESLint
- JavaScript React files lint with ESLint
- Lint runs on save and when you leave insert mode
- `Space ll` - Lint the current buffer now

## LSP Diagnostics

LSP diagnostics are configured with rounded floating windows and inline hints turned on.

Use these keys when working with errors:

- `gl` - Open the current error in a floating window
- `[d` - Jump to the previous error
- `]d` - Jump to the next error
- `K` - Show LSP hover documentation
- `Space td` - Toggle diagnostics for the current buffer

## Treesitter

Treesitter is used for syntax-aware editing on these filetypes:

- Dart
- TypeScript
- Java
- JavaScript
- JSON
- YAML
- HTML
- CSS
- Lua
- Vim
- Vimdoc

What it gives you:

- Native syntax highlighting through Neovim's Treesitter support
- Treesitter-based indentation for the supported filetypes

Useful Treesitter commands:

- `:TSInstall {language}` - Install a parser
- `:TSUpdate` - Update parsers
- `:TSUninstall {language}` - Remove a parser
- `:TSLog` - Show Treesitter install/update logs

## Java Development

Java buffers are started with `jdtls` automatically when you open a project rooted at:

- `.git`
- `mvnw`
- `gradlew`

This config is meant for:

- Java LSP features
- Project-aware navigation and diagnostics
- Working in Maven or Gradle projects

## Flutter / Dart

Flutter tooling is enabled through `flutter-tools.nvim`.

It supports:

- Dart / Flutter debugger integration
- Widget guide lines
- Flutter dev logs in a tab

## AI / Chat

OpenCode is available with these mappings:

- `og` - Toggle the OpenCode chat panel
- `oo` - Focus the OpenCode output window
- `o/` - Quick chat for the current line or visual selection

## Distraction-Free Writing

- `:ZenMode` - Toggle a focused writing / coding layout

ZenMode uses:

- A centered 120-column window
- Line numbers on
- Relative numbers on
- Git signs hidden while focused

## Filetype Notes

- Java buffers automatically launch `jdtls` through `ftplugin/java.lua`
- Markdown, plain text, and other unlisted filetypes use the default Neovim behavior
- Markdown rendering can be toggled per buffer with `Space mt`
- Icons in Neo-tree and completion require a Nerd Font

## Markdown

Markdown rendering is provided by `render-markdown.nvim`.

- `Space mt` - Toggle markdown rendering for the current buffer
- `:RenderMarkdown toggle` - Toggle markdown rendering globally
- `:RenderMarkdown buf_toggle` - Toggle markdown rendering for current buffer

## Quick Reference

- Search files: `Space ff`
- Search text: `Space fg`
- Open file tree: `Space e`
- Completion: `<C-Space>`
- AI chat: `og`
- Markdown render toggle: `Space mt`
- Zen mode: `:ZenMode`
- Formatter status: `:ConformInfo`
- Treesitter update: `:TSUpdate`
