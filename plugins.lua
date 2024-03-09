local plugins = {

  {
    "preservim/vimux"
  },
  {
    "nvim-tree/nvim-tree.lua",
    on_attach = function(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      local api = require "nvim-tree.api"
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    end
  },
  {
    "lukas-reineke/lsp-format.nvim",
  },
  {'RaafatTurki/hex.nvim'},
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
      ensure_installed = { "html", "css", "bash", "javascript", "go" },
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
  }

}

return plugins
