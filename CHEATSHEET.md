# Neovim Cheatsheet

This config uses `Space` as the leader key and is tuned for JavaScript/TypeScript, Dart/Flutter, Java Spring Boot, Markdown, Git, tmux, and AI-assisted coding.

For concepts and learning notes, read `NVIM_MENTAL_MODEL.md`.

## First Things To Remember

- `Space` is the leader key. Most custom commands start there.
- `jk` exits Insert mode.
- `:` opens command-line mode.
- `Esc` returns to Normal mode from most modes and popups.
- `:w` saves the current buffer.
- `:q` quits the current window.
- `:wq` saves and quits.
- `:qa` quits all windows.
- `:e path/to/file` opens a file.
- `:Lazy` opens the plugin manager.
- `:Mason` opens the external tool installer.
- `:checkhealth` checks your editor environment.

## Core Modes

- Normal mode - Navigate, edit structurally, run commands. This is your home base.
- Insert mode - Type text like a normal editor.
- Visual mode - Select text by character.
- Visual Line mode - Select whole lines with `V`.
- Visual Block mode - Select columns with `<C-v>`.
- Command-line mode - Run commands after pressing `:`.
- Terminal mode - Interact with a shell or terminal program inside Neovim.

Mode keys:

- `i` - Insert before cursor.
- `a` - Insert after cursor.
- `I` - Insert at start of line.
- `A` - Insert at end of line.
- `o` - Open line below and enter Insert mode.
- `O` - Open line above and enter Insert mode.
- `v` - Visual mode.
- `V` - Visual Line mode.
- `<C-v>` - Visual Block mode.
- `Esc` or `jk` - Return to Normal mode.

## Motion Basics

- `h` - Left.
- `j` - Down.
- `k` - Up.
- `l` - Right.
- `w` - Next word start.
- `b` - Previous word start.
- `e` - End of word.
- `0` - First column.
- `^` - First non-blank character.
- `$` - End of line.
- `gg` - Top of file.
- `G` - Bottom of file.
- `{` - Previous paragraph/block.
- `}` - Next paragraph/block.
- `%` - Matching bracket/paren/brace.
- `Ctrl+d` - Half page down.
- `Ctrl+u` - Half page up.
- `Ctrl+f` - Page down.
- `Ctrl+b` - Page up.
- `zz` - Center cursor line.
- `zt` - Put cursor line near top.
- `zb` - Put cursor line near bottom.

Counts:

- `5j` - Move down 5 lines.
- `3w` - Move forward 3 words.
- `10G` - Jump to line 10.
- `d3w` - Delete 3 words.

## Editing Operators

Operators combine with motions. Think verb + movement.

- `d` - Delete.
- `c` - Change: delete then enter Insert mode.
- `y` - Yank/copy.
- `>` - Indent.
- `<` - Outdent.
- `=` - Reindent.
- `gq` - Format text.

Examples:

- `dw` - Delete word.
- `ciw` - Change inside word.
- `di"` - Delete inside quotes.
- `ci(` - Change inside parentheses.
- `yi{` - Yank inside braces.
- `dap` - Delete a paragraph.
- `==` - Reindent current line.
- `>>` - Indent current line.
- `<<` - Outdent current line.
- `dd` - Delete current line.
- `cc` - Change current line.
- `yy` - Yank current line.

## Text Objects

Text objects are one of the reasons Vim feels powerful.

- `iw` - Inner word.
- `aw` - Around word.
- `is` - Inner sentence.
- `as` - Around sentence.
- `ip` - Inner paragraph.
- `ap` - Around paragraph.
- `i"` - Inside double quotes.
- `a"` - Around double quotes.
- `i'` - Inside single quotes.
- `a'` - Around single quotes.
- `i)` or `ib` - Inside parentheses.
- `a)` or `ab` - Around parentheses.
- `i]` - Inside brackets.
- `a]` - Around brackets.
- `i}` or `iB` - Inside braces.
- `a}` or `aB` - Around braces.
- `it` - Inside HTML/XML tag.
- `at` - Around HTML/XML tag.

Useful patterns:

- `ci"` - Replace text inside quotes.
- `da(` - Delete parentheses and their contents.
- `yit` - Copy the text inside a tag.
- `vat` - Visually select a whole tag.

## Search And Replace

- `/text` - Search forward.
- `?text` - Search backward.
- `n` - Next match.
- `N` - Previous match.
- `*` - Search word under cursor forward.
- `#` - Search word under cursor backward.
- `:%s/old/new/g` - Replace in whole file.
- `:%s/old/new/gc` - Replace in whole file with confirmation.
- `:s/old/new/g` - Replace on current line.
- `:'<,'>s/old/new/g` - Replace in visual selection.
- `:noh` - Clear search highlight.

Your search is smart-case:

- `user` matches `user`, `User`, and `USER`.
- `User` matches with case sensitivity.

## Files, Buffers, Windows, Tabs

- Buffer - An open file or in-memory text.
- Window - A view onto a buffer.
- Tab page - A saved layout of windows.

Buffer commands:

- `Space fb` - Pick an open buffer.
- `:ls` - List buffers.
- `:b 3` - Switch to buffer 3.
- `:b filename` - Switch by filename.
- `:bd` - Delete/unload current buffer.
- `:bufdo command` - Run a command across buffers.

Window commands:

- `:split` - Horizontal split.
- `:vsplit` - Vertical split.
- `Ctrl+w h` - Move to left split.
- `Ctrl+w j` - Move to lower split.
- `Ctrl+w k` - Move to upper split.
- `Ctrl+w l` - Move to right split.
- `Ctrl+w =` - Equalize split sizes.
- `Ctrl+w _` - Maximize split height.
- `Ctrl+w |` - Maximize split width.
- `Ctrl+w o` - Close other windows.

Tab commands:

- `:tabnew` - New tab page.
- `:tabclose` - Close tab page.
- `gt` - Next tab page.
- `gT` - Previous tab page.

## Snacks Picker And Explorer

Powered by `snacks.nvim`.

Search and navigation:

- `Space ff` - Find files.
- `Space fg` - Live grep across the project.
- `Space fw` - Grep word under cursor or visual selection.
- `Space fb` - Pick open buffers.
- `Space fr` - Recent files.
- `Space fh` - Help tags.
- `Space fd` - Workspace diagnostics.
- `Space fD` - Buffer diagnostics.
- `Space fs` - Document symbols.
- `Space fS` - Workspace symbols.
- `Space fp` - Find `package.json`.
- `Space fR` - Resume last picker.
- `Space ft` - Find TODO/FIXME comments.

Explorer:

- `Space e` - Toggle file explorer.
- `Space E` - Reveal current file in explorer.
- `<Enter>` or `l` - Open file or expand folder.
- `h` - Collapse folder.
- `<BS>` - Go up a directory.
- `a` - Add file or folder.
- `d` - Delete file or folder.
- `r` - Rename.
- `m` - Move.
- `c` - Copy.
- `H` - Toggle hidden files.
- `I` - Toggle ignored files.
- `P` - Toggle preview.

Picker habits:

- Type a few distinctive letters instead of full names.
- Use file search for known files.
- Use grep when you remember text but not the file.
- Use symbols when you know the function/class name.
- Use diagnostics when you are cleaning up errors.

## Completion

Completion is handled by `blink.cmp`.

- `<C-Space>` - Trigger completion.
- `<C-j>` - Next completion item.
- `<C-k>` - Previous completion item.
- `<C-f>` - Scroll documentation down.
- `<C-b>` - Scroll documentation up.
- `<C-e>` - Close completion.
- `<Tab>` - Move through completion or jump forward in snippets.
- `<S-Tab>` - Move backward through completion or snippets.
- `<Enter>` - Accept selected completion item only.

Completion sources:

- LSP suggestions from TypeScript, Dart, Java, etc.
- Snippets from `friendly-snippets`.
- File paths.
- Words already in the current buffer.

## LSP

LSP gives language intelligence: go to definition, rename, hover, references, diagnostics, code actions, and inlay hints.

Navigation:

- `gd` - Go to definition.
- `gD` - Go to declaration.
- `gr` - References.
- `gI` - Implementations.
- `gy` - Type definition.
- `gai` - Incoming calls.
- `gao` - Outgoing calls.
- `K` - Hover documentation.
- `Ctrl+s` in Insert mode - Signature help.
- `Space lh` - Signature help.

Actions:

- `Space la` - Code action.
- `Space lr` - Rename symbol.
- `Space lq` - Put diagnostics in location list.
- `Space lQ` - Put diagnostics in quickfix list.

Diagnostics:

- `gl` - Show current line diagnostic.
- `[d` - Previous diagnostic.
- `]d` - Next diagnostic.
- `Space td` - Toggle diagnostics.
- `Space th` - Toggle inlay hints.

Display toggles:

- `Space tn` - Toggle line number.
- `Space tr` - Toggle relative number.
- `Space tw` - Toggle wrap.

When LSP feels broken:

- `:LspInfo` - See attached language servers.
- `:Mason` - Check installed servers/tools.
- `:checkhealth vim.lsp` - Check LSP health.
- `Space xX` - See buffer diagnostics.
- `Space xx` - See workspace diagnostics.

## Trouble, Diagnostics, Todos

Trouble gives list views for errors, symbols, references, quickfix, and todos.

- `Space xx` - Workspace diagnostics.
- `Space xX` - Buffer diagnostics.
- `Space xs` - Symbols.
- `Space xl` - LSP definitions/references.
- `Space xL` - Location list.
- `Space xQ` - Quickfix list.
- `Space xt` - Todo Trouble.
- `Space ft` - Find todos.
- `]t` - Next TODO/FIXME.
- `[t` - Previous TODO/FIXME.

TODO comments commonly recognized:

- `TODO`
- `FIXME`
- `BUG`
- `HACK`
- `NOTE`
- `PERF`
- `TEST`
- `WARN`

## Formatting And Linting

Formatting is handled by Conform.

- `Space lf` - Format current buffer.
- `Space li` - Formatter info.
- `:ConformInfo` - Show formatter status.

Format on save is enabled.

Prettier formats:

- JavaScript
- TypeScript
- React files
- JSON and JSONC
- CSS and SCSS
- HTML
- YAML
- Markdown
- GraphQL

Dart and Java fall back to LSP formatting.

Linting is handled by `nvim-lint`.

- `Space ll` - Lint current buffer.

ESLint runs for JavaScript and TypeScript after saving.

Formatter vs linter:

- Formatter asks: “Does this code look consistent?”
- Linter asks: “Is this suspicious, invalid, unsafe, or against rules?”
- LSP asks: “What does this code mean semantically?”

## Git

Git signs show added, changed, and deleted lines in the sign column.

Hunk commands:

- `]c` - Next Git hunk.
- `[c` - Previous Git hunk.
- `Space hs` - Stage hunk.
- `Space hr` - Reset hunk.
- `Space hS` - Stage whole buffer.
- `Space hu` - Undo stage hunk.
- `Space hp` - Preview hunk.
- `Space hb` - Blame line.
- `Space hd` - Diff buffer.
- `Space hD` - Diff against HEAD.

Git pickers and UI:

- `Space gs` - LazyGit.
- `Space gl` - Git log.
- `Space gL` - Git log for current line.
- `Space gf` - Git log for current file.
- `Space gb` - Git branches.
- `Space gd` - Git diff hunks.
- `Space gS` - Git stash.

Suggested Git flow:

- Use `Space hp` to inspect a hunk.
- Use `Space hs` to stage precise hunks.
- Use `Space gs` when you want a full Git UI.
- Use `Space hb` when you need to know why a line exists.

## Debugging

Debugging is powered by `nvim-dap`.

- `Space db` - Toggle breakpoint.
- `Space dB` - Conditional breakpoint.
- `Space dc` - Continue.
- `Space di` - Step into.
- `Space do` - Step over.
- `Space dO` - Step out.
- `Space dr` - Toggle REPL.
- `Space dl` - Run last debug session.
- `Space dt` - Terminate session.
- `Space du` - Toggle debug UI.

Debugging vocabulary:

- Breakpoint - Pause execution at a line.
- Conditional breakpoint - Pause only if an expression is true.
- Step over - Run the current line without entering called functions.
- Step into - Enter the called function.
- Step out - Finish the current function and return to caller.
- REPL - Interactive debug console.

## Flutter And Dart

Flutter tooling is handled by `flutter-tools.nvim`.

Important note: do not configure `dartls` separately. Flutter Tools owns Dart LSP startup.

- `Space Fr` - Flutter run.
- `Space Fd` - Flutter debug.
- `Space Fq` - Flutter quit.
- `Space FR` - Hot reload.
- `Space FS` - Hot restart.
- `Space FD` - Devices.
- `Space FE` - Emulators.
- `Space Fo` - Outline.
- `Space Fl` - Dev log.
- `Space Fc` - Clear dev log.
- `Space Fp` - `flutter pub get`.
- `Space Fa` - Reanalyze.
- `Space FL` - Restart Dart LSP.

Flutter workflow:

- Open a Flutter project.
- Run `Space FD` to choose a device.
- Run `Space Fr` to start.
- Use `Space FR` for hot reload.
- Use `Space FS` when app state or initialization needs a restart.
- Use `Space Fl` to inspect logs.
- Use `Space Fd` when you need breakpoints.

## Java And Spring Boot

Java buffers use `nvim-jdtls` with Mason-managed `jdtls`, Java debug, and Java test bundles when installed.

Project roots are detected from:

- `mvnw`
- `gradlew`
- `pom.xml`
- `build.gradle`
- `build.gradle.kts`
- `.git`

Java actions:

- `Space jo` - Organize imports.
- `Space jv` - Extract variable.
- `Space jm` - Extract method from visual selection.
- `Space jt` - Test nearest method.
- `Space jT` - Test class.
- `Space ju` - Update project config.
- `Space jr` - Restart JDTLS.

Java workflow:

- Open a file inside a Maven or Gradle project.
- Run `:LspInfo` and confirm `jdtls` is attached.
- Use `Space jo` after edits to clean imports.
- Use `Space jt` for the nearest test.
- Use `Space jT` for the test class.
- Use `Space db` and `Space dc` for debug flows once launch configs exist.

## JavaScript And TypeScript

Tooling:

- `ts_ls` provides TypeScript/JavaScript LSP.
- `eslint` provides lint intelligence.
- `eslint_d` powers fast linting through `nvim-lint`.
- `prettier` formats supported frontend files.

Daily flow:

- `Space ff` to jump to a file.
- `Space fg` to search across project text.
- `gd` to jump to definitions.
- `gr` to inspect references.
- `Space lr` to rename safely.
- `Space la` to apply imports, fixes, and refactors.
- `Space lf` to format now.
- `Space ll` to lint now.
- `Space xx` to clean project diagnostics.

## Editing Power Tools

Autopairs:

- Automatically inserts matching quotes, parentheses, brackets, and braces.

Surround:

- Use surround commands to add, change, or delete wrappers like quotes, brackets, parentheses, and tags.
- Common examples from `nvim-surround`: `ysiw"` surrounds word with quotes, `cs"'` changes double quotes to single quotes, `ds"` deletes surrounding double quotes.

Comments:

- `gcc` - Toggle line comment.
- `gc{motion}` - Toggle comment over motion.
- `gc` in Visual mode - Comment selection.
- `gbc` - Toggle block comment.
- `gb{motion}` - Block comment over motion.

Useful editing habits:

- Prefer text objects: `ci"`, `ci(`, `dap`, `yit`.
- Prefer LSP rename over search/replace for symbols.
- Prefer Git hunk staging over staging whole files when making mixed changes.
- Use `.` to repeat the last edit.

## Markdown, AI, And Focus

Markdown:

- `Space mt` - Toggle Markdown rendering.
- `:RenderMarkdown toggle` - Toggle globally.
- `:RenderMarkdown buf_toggle` - Toggle current buffer.

OpenCode:

- `og` - Toggle OpenCode chat.
- `oo` - Open OpenCode output.
- `o/` - Quick chat for current line or visual selection.

Focus:

- `:ZenMode` - Toggle focused layout.

## Tmux

Pane navigation works across tmux and Neovim splits:

- `Ctrl+h` - Left.
- `Ctrl+j` - Down.
- `Ctrl+k` - Up.
- `Ctrl+l` - Right.

Your tmux prefix is `Ctrl+a`.

Common tmux commands:

- `Ctrl+a c` - New window.
- `Ctrl+a n` - Next window.
- `Ctrl+a p` - Previous window.
- `Ctrl+a ,` - Rename window.
- `Ctrl+a %` - Vertical split.
- `Ctrl+a "` - Horizontal split.
- `Ctrl+a x` - Kill pane.
- `Ctrl+a d` - Detach.

## Health And Maintenance

- `:Lazy` - Plugin UI.
- `:Lazy sync` - Install/update plugins.
- `:Lazy check` - Check for plugin updates.
- `:Mason` - External tool installer.
- `:MasonToolsInstall` - Install configured Mason tools.
- `:checkhealth` - Full health check.
- `:checkhealth snacks blink.cmp mason jdtls dap flutter-tools` - Targeted health check.
- `:LspInfo` - Active LSP clients.
- `:ConformInfo` - Formatter status.

When something seems wrong:

- Check `:messages`.
- Check `:LspInfo`.
- Check `:Mason`.
- Check `:ConformInfo`.
- Try reopening the project from its root.
- Restart Neovim if an LSP server is stuck.

## Practice Drills

Navigation drill:

- Open a project.
- Use `Space ff` to find 5 files.
- Use `Space fg` to find a function by text.
- Use `gd` and `gr` on 3 symbols.
- Use `Space fb` to jump between buffers.

Editing drill:

- Use `ci"` to change text inside quotes.
- Use `ci(` to change function arguments.
- Use `dap` to delete a paragraph/block.
- Use `.` to repeat an edit.

LSP drill:

- Hover with `K`.
- Rename with `Space lr`.
- Trigger a code action with `Space la`.
- Open diagnostics with `Space xx`.

Git drill:

- Make a small edit.
- Preview it with `Space hp`.
- Stage the hunk with `Space hs`.
- Open LazyGit with `Space gs`.

Flutter drill:

- Select device with `Space FD`.
- Run with `Space Fr`.
- Hot reload with `Space FR`.
- Open logs with `Space Fl`.

Java drill:

- Open a Java file in a Maven/Gradle project.
- Confirm `jdtls` in `:LspInfo`.
- Organize imports with `Space jo`.
- Run nearest test with `Space jt`.
