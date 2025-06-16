return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 3, {
        function()
          return require("pomodoro").get_pomodoro_status("🍅❌", "🍅", "☕")
        end,
      })
    end,
  },
}
