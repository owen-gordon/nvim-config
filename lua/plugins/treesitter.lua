return {
  {
    -- The `main` branch needs Neovim 0.12+ and the tree-sitter CLI on PATH.
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Install parsers
      local parsers = {
        "c", "make", "python", "lua", "vim", "vimdoc", "query",
        "json", "yaml", "bash", "markdown", "markdown_inline",
      }
      local installed = require("nvim-treesitter").get_installed()
      local to_install = vim.tbl_filter(function(p)
        return not vim.tbl_contains(installed, p)
      end, parsers)
      if #to_install > 0 then
        if vim.fn.executable("tree-sitter") == 1 then
          require("nvim-treesitter").install(to_install)
        else
          vim.notify("tree-sitter CLI not found; can't install parsers: " .. table.concat(to_install, ", "), vim.log.levels.WARN)
        end
      end

      -- Neovim doesn't turn on treesitter highlighting by itself; start it for
      -- any filetype that has a parser (pcall skips the ones that don't).
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
