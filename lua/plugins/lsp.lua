return {
  { "mason-org/mason.nvim", config = true },
  -- Provides the default server configs (cmd, filetypes, root markers) that
  -- vim.lsp.enable() and mason-lspconfig build on.
  { "neovim/nvim-lspconfig" },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
          "--completion-style=detailed",
        },
      })

      -- Pyright is a Node app, so skip it on machines without Node (e.g. a bare VM).
      local servers = { "clangd" }
      if vim.fn.executable("npm") == 1 then
        table.insert(servers, "pyright")
      end

      -- Installs the servers, then vim.lsp.enable()s everything Mason has installed.
      require("mason-lspconfig").setup({ ensure_installed = servers })

      vim.diagnostic.config({
        virtual_text = { spacing = 2, source = "if_many" },
        severity_sort = true,
        float = { border = "rounded", source = true },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client then
            vim.notify("LSP attached: " .. client.name, vim.log.levels.INFO)
          end

          -- Inline type / parameter-name hints (like VS Code's inlay hints)
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
          end

          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("<F12>", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", vim.lsp.buf.references, "References")
          map("gi", vim.lsp.buf.implementation, "Implementation")
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<F2>", vim.lsp.buf.rename, "Rename")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
          map("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
          map("<leader>d", vim.diagnostic.open_float, "Show diagnostic")
          map("<leader>ih", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
          end, "Toggle inlay hints")
          if client and client.name == "clangd" then
            map("<A-o>", "<Cmd>LspClangdSwitchSourceHeader<CR>", "Switch source/header")
          end
          vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "Signature help" })
        end,
      })
    end,
  },
}
