vim.api.nvim_set_keymap("n", "<leader>tcd", ":Copilot disable<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tce", ":Copilot enable<CR>", { noremap = true, silent = true })

return {
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup {
        override = function(c, p)
          return {
            LspInlayHint = { bg = c.editor.background, fg = c.dimmed3 },
          }
        end,
      }
    end,
  },
  {
    "vague2k/vague.nvim",
    config = function() require("vague").setup {} end,
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "AndrewRadev/switch.vim",
    keys = {
      { "gs", nil, { "n", "v" }, desc = "Switch" },
    },
    config = function()
      local fk = [=[\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>]=]
      local sk = [=[\<\(\u\l\+\)\(\u\l\+\)\+\>]=]
      local tk = [=[\<\(\l\+\)\(_\l\+\)\+\>]=]
      local fok = [=[\<\(\u\+\)\(_\u\+\)\+\>]=]
      local folk = [=[\<\(\l\+\)\(\-\l\+\)\+\>]=]
      local fik = [=[\<\(\l\+\)\(\.\l\+\)\+\>]=]
      vim.g["switch_custom_definitions"] = {
        vim.fn["switch#NormalizedCaseWords"] {
          "sunday",
          "monday",
          "tuesday",
          "wednesday",
          "thursday",
          "friday",
          "saturday",
        },
        vim.fn["switch#NormalizedCase"] { "yes", "no" },
        vim.fn["switch#NormalizedCase"] { "on", "off" },
        vim.fn["switch#NormalizedCase"] { "left", "right" },
        vim.fn["switch#NormalizedCase"] { "up", "down" },
        vim.fn["switch#NormalizedCase"] { "enable", "disable" },
        vim.fn["switch#NormalizedCase"] { "Always", "Never" },
        vim.fn["switch#NormalizedCase"] { "debug", "info", "warning", "error", "critical" },
        { "==", "!=", "~=" },
        {
          [fk] = [=[\=toupper(submatch(1)) . submatch(2)]=],
          [sk] = [=[\=tolower(substitute(submatch(0), '\(\l\)\(\u\)', '\1_\2', 'g'))]=],
          [tk] = [=[\U\0]=],
          [fok] = [=[\=tolower(substitute(submatch(0), '_', '-', 'g'))]=],
          [folk] = [=[\=substitute(submatch(0), '-', '.', 'g')]=],
          [fik] = [=[\=substitute(submatch(0), '\.\(\l\)', '\u\1', 'g')]=],
        },
      }
    end,
  },
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "echasnovski/mini.icons" },
    },
    opts = {
      show_icons = true,
      leader_key = ";",
      buffer_leader_key = "m",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "^vendor/" },
      },
    },
  },
}
