-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.gleam" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.completion.avante-nvim" },
  --{ import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.github-nvim-theme" },
  { import = "astrocommunity.colorscheme.poimandres-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.search.grug-far-nvim" },
  {
    "onedarkpro.nvim",
    opts = {
      styles = {
        keywords = "italic",
        functions = "bold",
      },
      override = function(c)
        return {
          LspInlayHint = { bg = c.editor.background, fg = c.editorInlayHint.foreground },
        }
      end,
    },
  },
  -- import/override with your plugins folder
}
