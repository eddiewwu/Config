local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Bootstrap lazy.nvim if not installed
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- LSP Configuration
-- Install language servers via Mason: :MasonInstall jdtls gopls pyright ts_ls solargraph html lua_ls gofumpt black
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- JavaScript / TypeScript
    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
    })
    -- Ruby
    vim.lsp.config('solargraph', {
      capabilities = capabilities,
    })
    -- HTML
    vim.lsp.config('html', {
      capabilities = capabilities,
    })
    -- Lua
    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
    })
    -- Java
    vim.lsp.config('jdtls', {
      capabilities = capabilities,
    })
    -- Go
    vim.lsp.config('gopls', {
      capabilities = capabilities,
    })
    -- Python
    vim.lsp.config('pyright', {
      capabilities = capabilities,
    })

    -- Enable LSPs
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('solargraph')
    vim.lsp.enable('html')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('jdtls')
    vim.lsp.enable('gopls')
    vim.lsp.enable('pyright')

    -- Format on save (runs before :w completes)
    -- Uses null-ls or LSP formatters based on filetype
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    -- LSP Keymaps
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  end,
})
