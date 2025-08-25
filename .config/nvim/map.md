# Neovim Keymappings Reference

## Leader Key Mappings (`<Space>`)

### File & Buffer Operations
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Space>pv` | n | `:lua require("mini.files").open()` | Open file explorer (legacy) |
| `<Space>f` | n | `MiniPick.builtin.files` | Fuzzy find files |
| `<Space>b` | n | `MiniPick.builtin.buffers` | Fuzzy find buffers |
| `<Space>r` | n | `MiniExtra.pickers.visit_paths` | Recent/visited paths |
| `<Space>w` | n | `:update` | Save file |
| `<Space>ee` | n | `:e %:p:h/<Tab>` | Edit file in current directory |
| `<Space>es` | n | `:sp %:p:h/<Tab>` | Split edit file in current directory |
| `<Space>ev` | n | `:vs %:p:h/<Tab>` | Vertical split edit file in current directory |
| `-` | n | `MiniFiles.open` | Open file explorer at current file |

### Search & Navigation
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Space>/` | n | `MiniPick.builtin.grep_live` | Live grep search |
| `<Space>/` | x | `y:<C-U>Grep <C-R>"` | Search selected text |
| `<Space>*` | n | `:Grep <C-R><C-W>` | Search word under cursor |
| `<Space>*` | x | `y:<C-U>Grep <C-R>"` | Search selected text |
| `<Space>g` | n | `MiniExtra.pickers.diagnostic` | Show diagnostics |
| `<Space>s` | n | `MiniExtra.pickers.lsp` | LSP workspace symbols (LSP buffers only) |

### Clipboard Operations
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Space>y` | n/v | `"+y` | Yank to system clipboard |
| `<Space>Y` | n | `"+Y` | Yank line to system clipboard |
| `<Space>d` | n/v | `"_d` | Delete without yanking |
| `<Space>p` | x | `"_dP` | Paste without yanking |

### Utility
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Space><Space>` | n | `:so` | Source current file |
| `<Space>f` | n | Format entire buffer | Format whole buffer with formatprg |

## Toggle Mappings (`yo*`, `[o*`, `]o*`)

### Option Toggles
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `yob` | n | Toggle `background` | Toggle dark/light background |
| `yoc` | n | Toggle `cursorline` | Toggle cursor line highlight |
| `yoh` | n | Toggle inlay hints | Toggle LSP inlay hints (LSP buffers only) |
| `yol` | n | Toggle location list | Toggle location list window |
| `yom` | n | Toggle `mouse` | Toggle mouse support |
| `yon` | n | Toggle `number` | Toggle line numbers |
| `yop` | n | Toggle `paste` | Toggle paste mode |
| `yoq` | n | Toggle quickfix | Toggle quickfix window |
| `yor` | n | Toggle `relativenumber` | Toggle relative line numbers |
| `yos` | n | Toggle `spell` | Toggle spell checking |
| `yow` | n | Toggle `wrap` | Toggle line wrapping |

### Special Toggles
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `yod` | n | Toggle diff mode | Toggle diff mode for current window |
| `yoD` | n | `MiniDiff.toggle_overlay` | Toggle diff overlay |
| `yog` | n | Toggle diagnostics | Enable/disable vim.diagnostic |

### Enable/Disable Options
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `[ob` | n | Enable `background=dark` | Set dark background |
| `]ob` | n | Enable `background=light` | Set light background |
| `[oc` | n | Enable `cursorline` | Enable cursor line |
| `]oc` | n | Disable `cursorline` | Disable cursor line |
| `[od` | n | Enable diff mode | Enable diff for current window |
| `]od` | n | Disable diff mode | Disable diff for current window |
| *(similar pattern for other options)* | | | |

## Navigation & Movement

### Enhanced Movement
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `j` | n | `gj` or `j` | Down (display line vs real line) |
| `k` | n | `gk` or `k` | Up (display line vs real line) |
| `<C-d>` | n | `<C-d>zz` | Half page down, center cursor |
| `<C-u>` | n | `<C-u>zz` | Half page up, center cursor |
| `n` | n | `nzzzv` | Next search result, center cursor |
| `N` | n | `Nzzzv` | Previous search result, center cursor |

### Line Movement
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `J` | n | `mzJ\`z` | Join lines, preserve cursor position |
| `J` | x | `:m '>+1<CR>gv=gv` | Move selected lines down |
| `K` | x | `:m '<-2<CR>gv=gv` | Move selected lines up |
| `[e` | n | Move line up | Move current line up by count |
| `]e` | n | Move line down | Move current line down by count |
| `[e` | x | Move selection up | Move selected lines up |
| `]e` | x | Move selection down | Move selected lines down |

### Diff Navigation
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `[c` | n | Previous diff/hunk | Previous diff (native) or git hunk (MiniDiff) |
| `]c` | n | Next diff/hunk | Next diff (native) or git hunk (MiniDiff) |

### Argument Swapping (Treesitter)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `>a` | n | Swap argument right | Swap function argument with next |
| `<a` | n | Swap argument left | Swap function argument with previous |

## Search & Replace

### Search
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `/` | n | `ms/` | Search forward, set mark |
| `?` | n | `ms?` | Search backward, set mark |
| `//` | c | Search in visual selection | Search within visual selection |

### Sort
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gs` | n | Sort operator | Sort text object |
| `gs` | x | `:sort` | Sort selected lines |

## Formatting & Text Objects

### Formatting
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Space>f` | n | Format buffer | Format entire buffer with formatprg |
| `gq<CR>` | n | Format buffer | Format entire buffer with formatprg |
| `gq?` | n | Show format settings | Display formatprg and formatexpr |
| `=ap` | n | Format paragraph | Auto-indent paragraph, restore cursor |

## Terminal & Shell

### Terminal
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `\`<CR>` | n | Open terminal | Open terminal (fish if available) |
| `\`<Space>` | n | `:bo te ` | Terminal command prompt |
| `<Esc>` | t | `<C-\><C-N>` | Exit terminal mode |

## Make & Build

### Make Commands
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `m<CR>` | n | `:Make` | Run make |
| `m<Space>` | n | `:Make ` | Make with arguments |
| `m?` | n | Show makeprg | Display current makeprg setting |
| `<C-C>` | n | Cancel make | Cancel running make process (in make buffer) |

## Plugin-Specific Mappings

### Mini.nvim
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `ys*` | n | Add surround | Add surrounding characters |
| `ds*` | n | Delete surround | Delete surrounding characters |
| `cs*` | n | Change surround | Change surrounding characters |
| `S` | x | Add surround | Add surround to visual selection |
| `yss` | n | Surround line | Surround entire line |
| `gl*` | n/x | Align | Align text |
| `gL*` | n/x | Align with preview | Align text with preview |

### Snippy
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-]>` | i | Expand snippet | Expand snippet or jump forward |
| `<C-j>` | i/s | Next snippet | Jump to next snippet placeholder |
| `<C-k>` | i/s | Previous snippet | Jump to previous snippet placeholder |

### LSP (Buffer-specific)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `yoh` | n | Toggle inlay hints | Toggle LSP inlay hints |
| `<Space>s` | n | Workspace symbols | LSP workspace symbol search |
| `<2-LeftMouse>` | n | LSP hover | Show hover information (mouse) |

### Language-Specific
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gh` | n | Switch header/source | Switch between C/C++ header and source (C buffers) |

## Insert Mode Mappings

### Completion
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-Space>` | i | `<C-X><C-O>` | Trigger omni-completion |
| `<C-C>` | i | Cancel completion | Cancel completion or normal Ctrl-C |
| `<CR>` | i | Accept completion | Accept completion or normal Enter |

### Navigation (Readline-style)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-B>` | i | `<Left>` | Move cursor left |
| `<C-F>` | i | `<Right>` | Move cursor right |

## Command Mode Mappings

### Navigation
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-A>` | c | `<Home>` | Move to beginning of line |
| `<C-B>` | c | `<Left>` | Move cursor left |
| `<C-F>` | c | `<Right>` or `<C-F>` | Move right or open command window |
| `<C-P>` | c | `<C-P>` or `<Up>` | Previous command or wildmenu |
| `<C-N>` | c | `<C-N>` or `<Down>` | Next command or wildmenu |
| `<C-J>` | c | Navigate wildmenu | Navigate down in wildmenu |
| `<C-K>` | c | Navigate wildmenu | Navigate up in wildmenu |

### Command Aliases
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gr` | c | `:Grep` | Expand to Grep command |
| `grep` | c | `:Grep` | Expand to Grep command |

## Help & Documentation
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-S-/>` | n | `MiniPick.builtin.help` | Search help files |
| `gK` | n | `K` | Use keywordprg (since K is remapped by LSP) |

## Special Behavior

### Auto-triggered
- **Document highlighting**: Automatic on CursorHold/InsertLeave in LSP buffers
- **Inlay hints**: Available when LSP supports textDocument/inlayHint
- **Code lens**: Auto-refresh in LSP buffers with textDocument/codeLens support
- **Folding**: Auto-enabled for LSP (foldingRange) and Treesitter (folds query)

### Buffer-specific
- **Preview/Command windows**: `q` closes the window
- **Terminal buffers**: Auto-enter insert mode on open
- **LSP buffers**: Additional mappings for LSP-specific features

### Context-aware
- **Diff mode**: `[c`/`]c` use native diff navigation when `vim.wo.diff` is true
- **Completion**: `<C-C>` and `<CR>` behave differently when completion popup is visible
- **Wildmenu**: Command mode navigation adapts to wildmenu state
