return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Grep" },
      { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", "__pycache__" },
        },
      })
    end,
  },
}
