local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
    })
    vim.lsp.config('solargraph', {
      capabilities = capabilities,
    })
    vim.lsp.config('html', {
      capabilities = capabilities,
    })
    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
    })

    vim.lsp.enable('ts_ls')
    vim.lsp.enable('solargraph')
    vim.lsp.enable('html')
    vim.lsp.enable('lua_ls')

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  end,
})
