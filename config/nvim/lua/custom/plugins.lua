local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.configs.cmp"
      require "custom.configs.cmp"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>tt", "<cmd>TroubleToggle<cr>", "Toggle Trouble", { silent = true, noremap = true } },
    },
  },

  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
  },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "christoomey/vim-tmux-navigator", lazy = false },

  { "mfussenegger/nvim-dap" },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    init = function()
      require("rust-tools").setup()
    end,
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opt)
      local crates = require "crates"
      crates.setup(opt)
      crates.show()
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "tpope/vim-obsession",
    event = "VeryLazy",
  },
}

return plugins
