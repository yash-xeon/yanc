-- ~/.config/nvim/lua/plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    require("mason").setup()

    local servers = { "lua_ls", "pyright", "ts_ls" } -- adjust to your languages

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_enable = true, -- auto-enables installed servers via vim.lsp.enable()
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- apply merged capabilities (blink.cmp) to every server
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
      end,
    })
  end,
}
