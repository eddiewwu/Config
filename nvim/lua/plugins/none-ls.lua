-- null-ls.nvim: External formatters & linters (run via Mason or pip)
-- Install formatters: :MasonInstall gofumpt black stylua
-- Install pip: pip install isort
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua formatter
        null_ls.builtins.formatting.stylua,
        -- JavaScript / TypeScript / HTML / CSS / JSON / etc.
        null_ls.builtins.formatting.prettier,
        -- Go formatter
        null_ls.builtins.formatting.gofumpt,
        -- Python formatters (black formats code, isort organizes imports)
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })

    -- Manual format keybind (alternative to auto-format on save)
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
