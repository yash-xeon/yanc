-- ~/.config/nvim/lua/plugins/lazydev.lua
return {
  "folke/lazydev.nvim",
  ft = "lua", -- only loads for lua files
  opts = {
    library = {
      -- load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
