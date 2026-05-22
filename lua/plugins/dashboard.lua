return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", "<Cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", "<Cmd>Telescope oldfiles<CR>"),
        dashboard.button("g", "  Grep text", "<Cmd>Telescope live_grep<CR>"),
        dashboard.button("e", "  New file", "<Cmd>ene<CR>"),
        dashboard.button("c", "  Config", "<Cmd>e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("l", "  Lazy (plugins)", "<Cmd>Lazy<CR>"),
        dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
      }

      dashboard.section.footer.val = "Welcome back, Owen"

      alpha.setup(dashboard.config)
    end,
  },
}
