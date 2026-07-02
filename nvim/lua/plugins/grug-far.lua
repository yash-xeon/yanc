-- ~/.config/nvim/lua/plugins/grug-far.lua
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar", -- lazy-load: only loads when you run the command
  opts = {},       -- default config; customize below if needed
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open()
      end,
      desc = "Search and Replace (grug-far)",
    },
    {
      "<leader>sw",
      function()
        require("grug-far").open({
          prefills = { search = vim.fn.expand("<cword>") },
        })
      end,
      desc = "Search and Replace word under cursor",
    },
  },
}
