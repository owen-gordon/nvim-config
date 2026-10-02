return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- avante asks to track the latest commit, not releases
    -- Downloads prebuilt native libs. (`make` now always compiles them from
    -- source, which needs a Rust toolchain.)
    build = "bash build.sh",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      { "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      provider = "openai",
      providers = {
        openai = {
          model = "gpt-4o",
        },
      },
    },
  },
}
