return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<C-b>", "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
      { "<leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = { enabled = true },
          filtered_items = { hide_dotfiles = false, hide_gitignored = false },
        },
        window = { width = 30 },
      })
    end,
  },
}
