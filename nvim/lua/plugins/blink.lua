-- ~/.config/nvim/lua/plugins/completion.lua
return {
  "saghen/blink.cmp",
  dependencies = {
    "folke/lazydev.nvim", -- ensures lazydev loads before blink needs it
  },
  version = "*", -- use prebuilt binary release (skips needing Rust/Cargo)
  -- If you'd rather build from source with Rust installed, use this instead:
  -- build = function()
  --   require("blink.cmp").build():pwait()
  -- end,

  opts = {
    keymap = { preset = "default" },

    completion = {
      documentation = { auto_show = true },
    },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- prioritize lazydev completions over lsp
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
