# Neovim Mental Model And Learning Notes

This document is the “why it works” companion to `CHEATSHEET.md`. The cheatsheet tells you what to press. This file explains what Neovim is thinking.

## The One Big Idea

Neovim is not mainly a file editor. It is a programmable editing environment built around buffers, windows, modes, commands, and events.

Most confusion disappears when you separate these ideas:

- A buffer is text loaded into memory.
- A window is a view of a buffer.
- A tab page is a layout of windows.
- A plugin is Lua code that teaches Neovim new behavior.
- An LSP server is a separate program that understands a language.
- Formatters rewrite code style.
- Linters report suspicious or invalid code.
- Pickers are interactive search-and-select UIs.

Once that clicks, Neovim stops feeling like a pile of shortcuts and starts feeling like a small operating system for code.

## Buffers, Windows, And Tabs

The most important distinction:

- Buffer: the file or text.
- Window: the rectangle showing a buffer.
- Tab page: a collection of windows.

If you open `main.ts`, Neovim creates a buffer for it. If you split the screen and show `main.ts` twice, you have one buffer shown in two windows. If you make a new tab page, you have another layout, but not necessarily another file.

Practical consequences:

- Closing a window does not always delete the buffer.
- Switching buffers is often better than opening endless tabs.
- Tabs are best for different work layouts, not every file.
- `Space fb` is your friend when you have several files open.

## Modes Are The Interface

Neovim has modes because editing is not just typing. Sometimes you type text. Sometimes you move. Sometimes you select. Sometimes you run commands.

The common modes:

- Normal mode: issue editing commands.
- Insert mode: type text.
- Visual mode: select text.
- Command-line mode: run commands.
- Terminal mode: interact with shell programs.

Normal mode is home base. When in doubt, press `Esc` or `jk`.

## The Vim Grammar

Vim commands are composable. This is the secret sauce.

Think:

```text
operator + motion/text object
```

Examples:

- `dw`: delete word.
- `ci"`: change inside quotes.
- `yap`: yank around paragraph.
- `>}`: indent until next paragraph/block.

The grammar matters more than memorizing hundreds of shortcuts. Once you know verbs and objects, you can create commands on the fly.

Useful verbs:

- `d`: delete.
- `c`: change.
- `y`: yank.
- `v`: select.
- `>`: indent.
- `<`: outdent.
- `=`: reindent.

Useful objects:

- `w`: word.
- `p`: paragraph.
- `"`: quotes.
- `(`: parentheses.
- `{`: braces.
- `t`: tag.

This is how you get fast without becoming a shortcut collector.

## Leader Key

Your leader key is `Space`.

Leader mappings are custom commands grouped by topic:

- `Space f`: find/search.
- `Space l`: LSP, lint, format.
- `Space x`: diagnostics/Trouble.
- `Space g`: Git.
- `Space h`: Git hunks.
- `Space d`: debug.
- `Space F`: Flutter.
- `Space j`: Java.
- `Space m`: Markdown.
- `Space t`: toggles.

If you pause after pressing `Space`, `which-key.nvim` shows possible next keys. That means you do not have to memorize everything immediately.

## Pickers

A picker is a fuzzy searchable list. Your setup uses `snacks.nvim` for this.

Pickers answer questions like:

- Which file do I want?
- Where is this text?
- Which buffer is open?
- Where is this symbol?
- Which diagnostic should I jump to?
- Which Git branch, hunk, or commit do I want?

The central habit: search by meaning, not by folder clicking.

Good picker instincts:

- Use `Space ff` when you know the file name.
- Use `Space fg` when you know text inside the file.
- Use `Space fs` when you know a function/class/symbol in the current file.
- Use `Space fS` when you know a symbol somewhere in the workspace.
- Use `Space fd` when you are fixing errors.
- Use `Space fr` when you recently touched the file.

## LSP

LSP stands for Language Server Protocol.

Neovim itself does not deeply understand TypeScript, Dart, or Java. Instead, it talks to external language servers:

- `ts_ls` for TypeScript/JavaScript.
- `eslint` for JS/TS lint intelligence.
- Dart language server through `flutter-tools.nvim`.
- `jdtls` for Java.

The LSP server reads your project and answers semantic questions:

- Where is this defined?
- What references this?
- What type is this?
- Can this import be fixed?
- Is this symbol safe to rename?
- What errors exist?

Important LSP commands:

- `gd`: go to definition.
- `gr`: references.
- `K`: hover docs.
- `Space lr`: rename.
- `Space la`: code action.
- `Space xx`: diagnostics.
- `:LspInfo`: inspect active servers.

LSP is project-aware. It works best when Neovim is opened inside a real project root with files like `package.json`, `pubspec.yaml`, `pom.xml`, `build.gradle`, or `.git`.

## Diagnostics

Diagnostics are messages attached to code locations.

They can come from:

- LSP servers.
- ESLint.
- TypeScript.
- Dart analyzer.
- JDTLS.
- Other tooling.

Common diagnostic severities:

- Error: likely broken.
- Warning: suspicious or discouraged.
- Information: useful note.
- Hint: optional improvement.

Your practical loop:

- Use `gl` for the diagnostic under the cursor.
- Use `[d` and `]d` to move through diagnostics.
- Use `Space xX` for current-buffer diagnostics.
- Use `Space xx` for project diagnostics.

## Formatting

Formatting changes how code looks, not usually what it means.

Your setup uses Conform:

- Prettier formats JS/TS/React/JSON/CSS/HTML/YAML/Markdown/GraphQL.
- Dart and Java fall back to LSP formatting.
- Formatting happens on save.
- `Space lf` formats manually.
- `:ConformInfo` explains which formatter is being used.

Formatting is the “make it consistent” layer.

## Linting

Linting checks code quality, safety, and project rules.

Your setup uses `nvim-lint` with `eslint_d` for JS/TS. ESLint also runs as an LSP server for richer editor integration.

Linting is the “this may be wrong or against the rules” layer.

Examples of lint issues:

- Unused variable.
- Missing dependency in a React hook.
- Forbidden import.
- Bad async handling.
- Style rule violation.

Use:

- `Space ll`: lint now.
- `Space xx`: inspect diagnostics.
- `Space la`: ask LSP for fixes.

## Completion And Snippets

Completion is the popup that suggests what to type next. Your setup uses `blink.cmp`.

It combines suggestions from:

- LSP.
- Snippets.
- Paths.
- Current buffer words.

Snippets are templates. For example, typing a trigger may expand into a function, class, test, or widget skeleton.

Your completion habits:

- Use `<C-Space>` if completion does not appear.
- Use `<C-j>` and `<C-k>` to move.
- Use `<Tab>` for completion/snippet movement.
- Use `<Enter>` only when the right item is selected.

## Treesitter

Treesitter parses code into a syntax tree.

It improves:

- Highlighting.
- Indentation.
- Structural awareness.

LSP understands meaning. Treesitter understands shape. Both matter.

For example:

- Treesitter knows something is a function call.
- LSP knows which function it resolves to and what type it returns.

## Git Model

Your setup has two Git layers:

- `gitsigns.nvim` for inline hunk actions.
- Snacks/LazyGit for larger Git workflows.

A hunk is a contiguous block of changed lines.

Use hunk commands when:

- You want to stage part of a file.
- You want to preview a small change.
- You want to reset one change without touching others.

Use LazyGit when:

- You want a full Git dashboard.
- You are committing.
- You are pushing/pulling.
- You are browsing branches or history.

Good Git rhythm:

- Edit.
- `Space hp` to preview.
- `Space hs` to stage good hunks.
- `Space gs` to commit in LazyGit.

## Debugging Model

DAP stands for Debug Adapter Protocol.

It is the debugging equivalent of LSP:

- LSP talks to language servers.
- DAP talks to debug adapters.

Debugging concepts:

- Breakpoint: pause here.
- Conditional breakpoint: pause here only when a condition is true.
- Continue: run until next breakpoint.
- Step over: run this line without entering function calls.
- Step into: enter the called function.
- Step out: finish current function and return.
- REPL: interactive console while debugging.

Your key habit:

- Set breakpoint with `Space db`.
- Start or continue with `Space dc`.
- Open UI with `Space du`.

Flutter and Java have the richest debug integration in this setup.

## JavaScript And TypeScript Mental Model

Your JS/TS stack has three main parts:

- TypeScript LSP: understands types, imports, definitions, references.
- ESLint: understands rules and code quality.
- Prettier: formats code.

Daily flow:

- Jump with `gd`.
- Rename with `Space lr`.
- Fix imports or rules with `Space la`.
- Format with `Space lf` or save.
- Inspect errors with `Space xx`.

When TS feels wrong:

- Check `:LspInfo`.
- Confirm you opened the project near `package.json`.
- Check `Space xx`.
- Restart Neovim if the TS server is stale.

## Flutter And Dart Mental Model

Flutter development has two loops:

- Edit-analyze loop.
- Run-hot-reload loop.

The edit-analyze loop:

- Dart LSP analyzes code.
- Diagnostics appear.
- Completion and hover work.
- Formatting happens through LSP fallback.

The run-hot-reload loop:

- `Space FD`: choose device.
- `Space Fr`: run app.
- `Space FR`: hot reload UI changes.
- `Space FS`: hot restart when state/initialization needs a reset.
- `Space Fl`: inspect logs.

If Flutter gets confused:

- `Space FL`: restart Dart LSP.
- `Space Fa`: reanalyze.
- `Space Fq`: quit Flutter process.
- Reopen Neovim from the Flutter project root.

## Java And Spring Boot Mental Model

Java support is powered by JDTLS. It is heavier than TS/Dart because Java project structure, classpaths, Gradle/Maven, tests, and debug configs matter a lot.

JDTLS needs a project root. Your config detects:

- `mvnw`
- `gradlew`
- `pom.xml`
- `build.gradle`
- `build.gradle.kts`
- `.git`

Java capabilities:

- Type-aware navigation.
- Import organization.
- Extract variable/method.
- Test nearest method/class.
- Debug support through Java debug adapter.

Useful loop:

- Open Java file from project root.
- Confirm `jdtls` with `:LspInfo`.
- Use `Space jo` often.
- Use `Space jt` near tests.
- Use `Space ju` after build file changes.
- Use `Space jr` when JDTLS gets stale.

## Mason, Lazy, And External Tools

There are two kinds of dependencies:

- Plugins: Neovim Lua packages installed by Lazy.
- Tools: external programs installed by Mason.

Lazy manages:

- `snacks.nvim`
- `blink.cmp`
- `trouble.nvim`
- `flutter-tools.nvim`
- `nvim-jdtls`
- etc.

Mason manages:

- `ts_ls`
- `eslint`
- `jdtls`
- `prettier`
- `eslint_d`
- `java-debug-adapter`
- `java-test`

Use:

- `:Lazy` for plugins.
- `:Mason` for external tools.
- `:checkhealth` for environment checks.

## How To Get Better Over Time

Do not try to memorize everything at once. Neovim skill compounds through repeated small habits.

Week 1: survive comfortably.

- Use `Space ff`, `Space fg`, `Space fb`.
- Learn `i`, `a`, `o`, `Esc`, `jk`.
- Save with `:w`.
- Quit with `:q`.
- Use `K`, `gd`, `gr`.

Week 2: edit with grammar.

- Practice `dw`, `cw`, `ci"`, `ci(`, `dap`.
- Use `.` to repeat edits.
- Use `/`, `n`, `N`.
- Use visual selection less often when a text object works.

Week 3: lean into LSP.

- Rename with `Space lr`.
- Fix code with `Space la`.
- Navigate diagnostics with `[d`, `]d`, `Space xx`.
- Use symbols with `Space fs`.

Week 4: work like a surgeon.

- Stage hunks with `Space hs`.
- Preview hunks with `Space hp`.
- Use quickfix/location lists.
- Debug with `Space db`, `Space dc`, `Space du`.

Long-term: learn by friction.

- When something feels slow, ask: is there a motion, text object, picker, or LSP command for this?
- When repeating a sequence, ask: can `.` repeat this?
- When manually editing many places, ask: should this be LSP rename, search/replace, macro, or multi-file grep?

## Mental Checklist While Coding

When opening a project:

- Did I open Neovim from the project root?
- Does `:LspInfo` show the expected server?
- Does `Space xx` show diagnostics?
- Does `:ConformInfo` show the expected formatter?
- Does `:Mason` show required tools installed?

When editing:

- Can I use a text object instead of selecting manually?
- Can I use LSP rename instead of search/replace?
- Can I jump to the symbol instead of scrolling?
- Can I stage only this hunk?

When debugging:

- Can I reproduce the issue?
- Where should execution pause?
- Should I step into or step over?
- What variable do I need to inspect?

## Common Confusions

“Why did closing a window not close the file?”

Because the file is a buffer. The window was only a view.

“Why does LSP work in one project but not another?”

Usually root detection, missing dependencies, or opening Neovim outside the project root.

“Why do formatting and linting both complain?”

They do different jobs. Formatting handles appearance. Linting handles rules and likely problems.

“Why does Java feel heavier than TypeScript?”

JDTLS needs project metadata, classpaths, build files, test bundles, and sometimes time to import the project.

“Why use pickers instead of the file tree?”

Pickers are faster when you know what you want. The file tree is better when exploring unfamiliar structure.

## Your North Star

The goal is not to become a Vim trivia machine.

The goal is to move through code with less drag:

- Search instead of browse.
- Jump instead of scroll.
- Rename semantically instead of text replacing.
- Fix diagnostics from a list.
- Stage changes intentionally.
- Build small habits until they feel invisible.

That is the good stuff.
