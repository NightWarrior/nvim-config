# nvim-config

Neovim configuration with lazy.nvim plugin manager.

## Requirements

Before using this configuration, ensure you have the following installed:

### Required Dependencies

1. **Neovim** (v0.11.0 or higher)
   - Required for the modern `vim.lsp.config` API
   - Download from [neovim.io](https://neovim.io/)

2. **Git**
   - Required for lazy.nvim to clone plugins
   - Download from [git-scm.com](https://git-scm.com/)

3. **Node.js and npm** (v16 or higher)
   - Required for many LSP servers and plugins (e.g., TypeScript, ESLint)
   - Install via [nodejs.org](https://nodejs.org/) or use nvm
   - **nvm (Node Version Manager)** recommended for managing Node versions:
     - Windows: [nvm-windows](https://github.com/coreybutler/nvm-windows)
     - Unix/Linux/Mac: [nvm](https://github.com/nvm-sh/nvm)

4. **Python 3** (v3.8 or higher)
   - Required for Python provider and some plugins
   - Download from [python.org](https://www.python.org/)
   - Create a virtual environment for Neovim:
     ```bash
     # Windows
     python -m venv %USERPROFILE%\.venvs\nvim
     %USERPROFILE%\.venvs\nvim\Scripts\pip install pynvim
     
     # Unix/Linux/Mac
     python3 -m venv ~/.venvs/nvim
     ~/.venvs/nvim/bin/pip install pynvim
     ```

5. **C Compiler** (for Treesitter)
   - Windows: Install [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/) or MinGW
   - Unix/Linux: `gcc` or `clang` (usually pre-installed)
   - Mac: Xcode Command Line Tools (`xcode-select --install`)

### Optional but Recommended

- **ripgrep** - For faster file searching with Telescope
  - Install: `winget install BurntSushi.ripgrep` (Windows) or `brew install ripgrep` (Mac)
- **fd** - Better file finder
  - Install: `winget install sharkdp.fd` (Windows) or `brew install fd` (Mac)
- **prettier** - For code formatting (if you use the prettier plugin)
  - Install globally: `npm install -g prettier`
- **A Nerd Font** - For icons in nvim-tree and lualine
  - Download from [nerdfonts.com](https://www.nerdfonts.com/)

## Installation

1. Clone or copy this configuration to your Neovim config directory:
   - Windows: `%LOCALAPPDATA%\nvim`
   - Unix/Linux/Mac: `~/.config/nvim`

2. Launch Neovim - lazy.nvim will automatically install on first run
   - Let it complete the installation (may take a few minutes)
   - Restart Neovim if needed

3. Install LSP servers via Mason:
   ```
   :MasonInstall
   ```
   Or install specific servers:
   ```
   :MasonInstall typescript-language-server lua-language-server python-lsp-server eslint-lsp
   ```

## What's Included

### Plugin Manager
- **lazy.nvim** - Fast and modern plugin manager

### LSP & Completion
- **Modern Neovim LSP** - Using native `vim.lsp.config` API (Neovim 0.11+)
- **Mason** - LSP server installer
- **nvim-cmp** - Autocompletion engine
- **LuaSnip** - Snippet engine

### UI Enhancements
- **Telescope** - Fuzzy finder
- **nvim-tree** - File explorer
- **lualine** - Status line
- **Catppuccin** - Color scheme

### Code Editing
- **Treesitter** - Syntax highlighting and parsing
- **nvim-autopairs** - Auto-close brackets
- **nvim-ts-autotag** - Auto-close HTML tags
- **vim-surround** - Surround text objects
- **nvim-comment** - Easy commenting
- **vim-visual-multi** - Multiple cursors

### Git Integration
- **gitsigns** - Git decorations
- **vim-fugitive** - Git commands

### Other Tools
- **Harpoon** - Quick file navigation
- **undotree** - Undo history visualizer
- **toggleterm** - Terminal integration
- **prettier** - Code formatting
- **null-ls** - Linting and formatting bridge

## Troubleshooting

### Common Warnings (Expected)
- **prettier not found**: Only appears if you haven't installed prettier globally. Install with `npm install -g prettier` if you want to use it

### Issues
- **LSP not working**: Run `:MasonInstall` and ensure Node.js is in PATH
- **Treesitter errors**: Ensure you have a C compiler installed
- **Python provider warnings**: Create the Python virtual environment as described above
- **Plugin installation fails**: Check internet connection and that Git is installed
- **Startup errors**: The config uses protected calls (pcall) to gracefully handle missing plugins during first install - just restart Neovim after plugins finish installing

## First-Time Setup

After installation, follow these steps:

1. Start Neovim - plugins will install automatically
2. Wait for lazy.nvim to finish (watch the bottom of the screen)
3. Restart Neovim
4. Run `:checkhealth` to verify everything is working
5. Install LSP servers: `:MasonInstall typescript-language-server lua-language-server`

## Testing Your Configuration

Run this command to verify no errors:
```bash
nvim --headless "+checkhealth" +qa
```
