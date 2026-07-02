-- ~/.config/nvim/lua/plugins/mini.lua
return {
  "echasnovski/mini.nvim",
  version = false, -- use latest commit, not stable tag
  config = function()
    require("mini.pairs").setup()       -- auto-close brackets/quotes
    require("mini.surround").setup()    -- add/change/delete surroundings (quotes, brackets)
    require("mini.comment").setup()     -- gcc / gc to comment lines
    require("mini.statusline").setup()  -- lightweight statusline
    require("mini.icons").setup()       -- icon provider (used by many plugins now)
  end,
}
