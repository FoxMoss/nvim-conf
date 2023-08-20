local M = {}
M.nvimtree = {
  plugin = true, -- Important

  n = {
    ["<S-m>"] = {
      function()
        require "nvim-tree.api".node.open.edit()
      end,
      "Open"
    }
  }
}
return M
