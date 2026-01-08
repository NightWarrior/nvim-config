require("lazy").setup({
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        pickers = {
          find_files = {
            -- hidden = true,
            -- no_ignore = true,
          }
        }
      })
    end
  },
  { 'catppuccin/nvim', name = 'catppuccin' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- Configuration moved to after/plugin/treesitter.lua
  },
  'nvim-treesitter/nvim-treesitter-context',
  'theprimeagen/harpoon',
  'mbbill/undotree',
  'nvimtools/none-ls.nvim',
  'MunifTanjim/prettier.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-obsession',
  -- LSP Support - Modern approach using vim.lsp.config (Neovim 0.11+)
  {
    'neovim/nvim-lspconfig',
    -- lspconfig is now just a collection of server configs, not a "framework"
  },
  {
    'williamboman/mason.nvim',
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'ts_ls',
          'eslint',
          'pylsp',
          'vimls',
          'clangd',
        },
        automatic_installation = true,
      })
    end,
  },
  'eandrju/cellular-automaton.nvim',
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {
        git = {
          ignore = false
        }
      }
    end
  },
  'windwp/nvim-ts-autotag',
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  --  'Exafunction/codeium.vim',
  --  '{
  --  ''github/copilot.vim',
  --  '},
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("todo-comments").setup {} end
  },
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'saadparwaiz1/cmp_luasnip',
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = "make install_jsregexp", -- Optional
  },
  'rafamadriz/friendly-snippets',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 10 -- Height for horizontal terminal
          elseif term.direction == "vertical" then
            return 40 -- Width for vertical terminal
          end
        end,
        open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl + \
        hide_numbers = true,    -- Hide line numbers in terminal mode
        shade_terminals = true, -- Dim background for terminals
        shading_factor = 2,     -- Darken terminal background slightly
        start_in_insert = true, -- Start in insert mode
        insert_mappings = true, -- Allows mappings in insert mode
        terminal_mappings = true, -- Enables terminal keybindings
        persist_size = true,    -- Terminal size remains the same
        direction = "float",    -- Default terminal mode (horizontal, vertical, float, tab)
        close_on_exit = true,   -- Auto-close terminal on process exit
        shell = vim.o.shell,    -- Use default shell
        float_opts = {
          border = "curved",    -- Floating terminal border style
          winblend = 10,        -- Transparency
        },
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup({ --[[ your config ]] })
    end,
  },
  'tpope/vim-surround',
  'tpope/vim-repeat',
  {
    'mg979/vim-visual-multi',
    branch = "master"
  },
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  }
})
