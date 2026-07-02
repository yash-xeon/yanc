-- cursor-dark.lua
-- A Neovim colorscheme inspired by Cursor IDE's default dark theme
-- (which itself is close to VS Code Dark Modern, with Cursor's signature
-- blue-accented UI).
--
-- INSTALL (lazy.nvim, local file):
--   1. Create folder structure: ~/.config/nvim/colors/cursor-dark.lua
--      (just drop this file there directly — no plugin manager needed)
--   2. In init.lua: vim.cmd.colorscheme("cursor-dark")
--
-- Or as a plugin (if you want it lazy-loaded / shareable):
--   ~/.config/nvim/lua/plugins/cursor-dark.lua
--     return { dir = "~/some/local/path", name = "cursor-dark.nvim",
--              config = function() vim.cmd.colorscheme("cursor-dark") end }

local M = {}

-- Cursor Dark palette -------------------------------------------------
local palette = {
  bg          = "#1e1e1e", -- editor background
  bg_dark     = "#181818", -- sidebar / statusline / floats
  bg_highlight= "#2a2d2e", -- cursorline / visual selection bg
  bg_visual   = "#264f78", -- explicit selection
  bg_popup    = "#252526", -- popup menu bg
  fg          = "#d4d4d4", -- default text
  fg_dark     = "#858585", -- line numbers, dim text
  fg_gutter   = "#4b4b4b",
  comment     = "#6a9955",
  string      = "#ce9178",
  number      = "#b5cea8",
  keyword     = "#c586c0",
  func        = "#dcdcaa",
  type        = "#4ec9b0",
  variable    = "#9cdcfe",
  constant    = "#4fc1ff",
  operator    = "#d4d4d4",
  punct       = "#d4d4d4",
  blue        = "#007acc", -- Cursor's signature accent (status bar, links)
  blue_bright = "#3794ff",
  purple      = "#c586c0",
  cyan        = "#4ec9b0",
  green       = "#6a9955",
  green_bright= "#89d185",
  yellow      = "#dcdcaa",
  orange      = "#ce9178",
  red         = "#f14c4c",
  red_bright  = "#f44747",
  magenta     = "#d16d9e",
  border      = "#454545",
  border_dim  = "#2d2d2d",
  selection   = "#264f78",
  match_paren = "#3b514d",
  diff_add    = "#487e02",
  diff_change = "#1b81a8",
  diff_delete = "#f14c4c",
  diff_text   = "#264f78",
  none        = "NONE",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "cursor-dark"

  local p = palette
  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor UI -----------------------------------------------------------
  hl("Normal",        { fg = p.fg, bg = p.bg })
  hl("NormalFloat",    { fg = p.fg, bg = p.bg_popup })
  hl("NormalNC",       { fg = p.fg, bg = p.bg })
  hl("FloatBorder",    { fg = p.border, bg = p.bg_popup })
  hl("Cursor",         { fg = p.bg, bg = p.fg })
  hl("CursorLine",     { bg = p.bg_highlight })
  hl("CursorLineNr",   { fg = p.fg, bold = true })
  hl("LineNr",         { fg = p.fg_gutter })
  hl("SignColumn",     { fg = p.fg_gutter, bg = p.bg })
  hl("ColorColumn",    { bg = p.bg_highlight })
  hl("VertSplit",      { fg = p.border_dim })
  hl("WinSeparator",   { fg = p.border_dim })
  hl("Visual",         { bg = p.selection })
  hl("VisualNOS",      { bg = p.selection })
  hl("Search",         { fg = p.bg, bg = p.yellow })
  hl("IncSearch",      { fg = p.bg, bg = p.orange })
  hl("CurSearch",      { fg = p.bg, bg = p.orange })
  hl("MatchParen",     { bg = p.match_paren, bold = true })
  hl("Pmenu",          { fg = p.fg, bg = p.bg_popup })
  hl("PmenuSel",       { fg = p.fg, bg = p.selection })
  hl("PmenuSbar",      { bg = p.bg_popup })
  hl("PmenuThumb",     { bg = p.border })
  hl("StatusLine",     { fg = p.fg, bg = p.blue })
  hl("StatusLineNC",   { fg = p.fg_dark, bg = p.bg_dark })
  hl("TabLine",        { fg = p.fg_dark, bg = p.bg_dark })
  hl("TabLineFill",    { bg = p.bg_dark })
  hl("TabLineSel",     { fg = p.fg, bg = p.bg })
  hl("Title",          { fg = p.blue_bright, bold = true })
  hl("Directory",      { fg = p.blue_bright })
  hl("Folded",         { fg = p.fg_dark, bg = p.bg_highlight })
  hl("FoldColumn",     { fg = p.fg_gutter, bg = p.bg })
  hl("NonText",        { fg = p.fg_gutter })
  hl("Whitespace",     { fg = p.fg_gutter })
  hl("EndOfBuffer",    { fg = p.bg })
  hl("WinBar",         { fg = p.fg, bg = p.bg })
  hl("WinBarNC",       { fg = p.fg_dark, bg = p.bg })

  -- Diagnostics -----------------------------------------------------
  hl("DiagnosticError", { fg = p.red_bright })
  hl("DiagnosticWarn",  { fg = p.yellow })
  hl("DiagnosticInfo",  { fg = p.blue_bright })
  hl("DiagnosticHint",  { fg = p.cyan })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red_bright })
  hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = p.yellow })
  hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = p.blue_bright })
  hl("DiagnosticUnderlineHint",  { undercurl = true, sp = p.cyan })

  -- Diff --------------------------------------------------------------
  hl("DiffAdd",    { bg = "#203424" })
  hl("DiffChange", { bg = "#1a2b3a" })
  hl("DiffDelete", { bg = "#3a2020" })
  hl("DiffText",   { bg = p.diff_text })

  -- Syntax --------------------------------------------------------------
  hl("Comment",    { fg = p.comment, italic = true })
  hl("String",     { fg = p.string })
  hl("Character",  { fg = p.string })
  hl("Number",     { fg = p.number })
  hl("Float",      { fg = p.number })
  hl("Boolean",    { fg = p.constant })
  hl("Constant",   { fg = p.constant })
  hl("Identifier", { fg = p.variable })
  hl("Function",   { fg = p.func })
  hl("Statement",  { fg = p.keyword })
  hl("Conditional",{ fg = p.keyword })
  hl("Repeat",     { fg = p.keyword })
  hl("Label",      { fg = p.keyword })
  hl("Operator",   { fg = p.operator })
  hl("Keyword",    { fg = p.keyword })
  hl("Exception",  { fg = p.keyword })
  hl("PreProc",    { fg = p.purple })
  hl("Include",    { fg = p.purple })
  hl("Define",     { fg = p.purple })
  hl("Macro",      { fg = p.purple })
  hl("Type",       { fg = p.type })
  hl("StorageClass",{ fg = p.type })
  hl("Structure",  { fg = p.type })
  hl("Typedef",    { fg = p.type })
  hl("Special",    { fg = p.yellow })
  hl("SpecialChar",{ fg = p.orange })
  hl("Tag",        { fg = p.blue_bright })
  hl("Delimiter",  { fg = p.punct })
  hl("Underlined", { underline = true })
  hl("Ignore",     { fg = p.fg_dark })
  hl("Error",      { fg = p.red_bright })
  hl("Todo",       { fg = p.bg, bg = p.yellow, bold = true })

  -- Treesitter ------------------------------------------------------
  hl("@variable",            { fg = p.variable })
  hl("@variable.builtin",    { fg = p.blue_bright, italic = true })
  hl("@variable.parameter",  { fg = p.variable })
  hl("@variable.member",     { fg = p.variable })
  hl("@constant",            { fg = p.constant })
  hl("@constant.builtin",    { fg = p.constant, italic = true })
  hl("@string",               { fg = p.string })
  hl("@string.escape",        { fg = p.yellow })
  hl("@character",            { fg = p.string })
  hl("@number",                { fg = p.number })
  hl("@boolean",               { fg = p.constant })
  hl("@function",              { fg = p.func })
  hl("@function.builtin",      { fg = p.func, italic = true })
  hl("@function.method",       { fg = p.func })
  hl("@constructor",           { fg = p.type })
  hl("@keyword",                { fg = p.keyword })
  hl("@keyword.function",       { fg = p.keyword })
  hl("@keyword.return",         { fg = p.keyword })
  hl("@keyword.operator",       { fg = p.keyword })
  hl("@conditional",            { fg = p.keyword })
  hl("@repeat",                 { fg = p.keyword })
  hl("@operator",                { fg = p.operator })
  hl("@punctuation.bracket",     { fg = p.punct })
  hl("@punctuation.delimiter",   { fg = p.punct })
  hl("@type",                     { fg = p.type })
  hl("@type.builtin",             { fg = p.type, italic = true })
  hl("@property",                  { fg = p.variable })
  hl("@field",                     { fg = p.variable })
  hl("@tag",                        { fg = p.blue_bright })
  hl("@tag.attribute",              { fg = p.variable })
  hl("@comment",                     { fg = p.comment, italic = true })
  hl("@module",                       { fg = p.type })
  hl("@namespace",                    { fg = p.type })

  -- LSP semantic tokens -----------------------------------------------
  hl("@lsp.type.class",     { fg = p.type })
  hl("@lsp.type.interface", { fg = p.type })
  hl("@lsp.type.enum",      { fg = p.type })
  hl("@lsp.type.parameter", { fg = p.variable })
  hl("@lsp.type.variable",  { fg = p.variable })
  hl("@lsp.type.function",  { fg = p.func })
  hl("@lsp.type.method",    { fg = p.func })

  -- Git signs -----------------------------------------------------------
  hl("GitSignsAdd",    { fg = p.green_bright })
  hl("GitSignsChange", { fg = p.blue_bright })
  hl("GitSignsDelete", { fg = p.red_bright })

  -- Telescope / nvim-tree (Cursor's blue accent shows up in file explorer) ---
  hl("TelescopeSelection", { bg = p.bg_highlight })
  hl("TelescopeBorder",    { fg = p.border })
  hl("NvimTreeNormal",     { fg = p.fg, bg = p.bg_dark })
  hl("NvimTreeFolderIcon", { fg = p.blue_bright })
  hl("NvimTreeRootFolder", { fg = p.blue_bright, bold = true })
  hl("NvimTreeIndentMarker", { fg = p.fg_gutter })
end

M.setup()

return M
