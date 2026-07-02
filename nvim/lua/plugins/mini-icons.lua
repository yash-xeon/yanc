-- ~/.config/nvim/lua/plugins/mini-icons.lua
return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.icons").setup()
  end,
}
