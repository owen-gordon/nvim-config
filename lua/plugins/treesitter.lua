return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      -- Install parsers
      local parsers = { "python", "lua", "vim", "vimdoc", "json", "yaml", "bash", "markdown" }
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          local installed = require("nvim-treesitter").get_installed()
          local to_install = vim.tbl_filter(function(p)
            return not vim.tbl_contains(installed, p)
          end, parsers)
          if #to_install > 0 then
            require("nvim-treesitter").install(to_install)
          end
        end,
      })
    end,
  },
}
