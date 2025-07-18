-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

--@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      copilothide = {
        {
          event = "User",
          pattern = "BlinkCmpMenuOpen",
          callback = function() vim.b.copilot_suggestion_hidden = true end,
        },
      },
      copilotshow = {
        {
          event = "User",
          pattern = "BlinkCmpMenuClose",
          callback = function() vim.b.copilot_suggestion_hidden = false end,
        },
      },
      gotabsize = {
        {
          event = "FileType",
          pattern = { "go", "c", "h", "cpp", "hpp", "java" },
          desc = "set tab size to 4 for certain file types",
          callback = function()
            vim.bo.tabstop = 4
            vim.bo.softtabstop = 4
            vim.bo.shiftwidth = 4
            vim.bo.expandtab = true
          end,
        },
      },
      -- unlinkluasniponmodechange = {
      --   {
      --     event = "ModeChanged",
      --     pattern = { "s:n", "i:*" },
      --     desc = "Forget the current snippet when leaving the insert mode",
      --     callback = function(evt)
      --       local luasnip = require "luasnip"
      --       while true do
      --         if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
      --           luasnip.unlink_current()
      --         else
      --           break
      --         end
      --       end
      --     end,
      --   },
      -- },
    },
  },
}
