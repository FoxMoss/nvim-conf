local plugins = {

  {
    "preservim/vimux"
  },
  {
    "lukas-reineke/lsp-format.nvim",
  },
  { 'RaafatTurki/hex.nvim' },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html",
        "prettier",
        "stylua",
        "denols",
        "tsserver",
        "emmet_ls"
      },
    },
  },
  {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "css", "bash", "javascript", "go" },
    },
  },
  {
    "andweeb/presence.nvim"
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = function(...)
              require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    enabled = true,
  },
  {
    "godlygeek/tabular",
    enabled = true,
  },
  {
    "preservim/vim-markdown",
    enabled = true,
  },
  {
    "martini97/project-config.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

}

return plugins
