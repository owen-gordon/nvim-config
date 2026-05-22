return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "catppuccin" },
      })
    end,
  },

  -- Tab bar
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          offsets = { { filetype = "neo-tree", text = "Explorer" } },
        },
      })
    end,
  },

  -- Indent guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },

  -- Git signs
  { "lewis6991/gitsigns.nvim", config = true },

  -- Which-key
  { "folke/which-key.nvim", event = "VeryLazy", config = true },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comment toggling
  { "numToStr/Comment.nvim", config = true },
}
