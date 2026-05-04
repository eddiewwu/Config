return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true, -- show hidden files by default
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            local state = require("neo-tree.sources.manager").get_state("filesystem")
            if not state or not state.tree then
              return
            end
            local preview = require("neo-tree.sources.common.preview")
            if not preview.is_active() then
              preview.toggle(state)
            end
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            local preview = require("neo-tree.sources.common.preview")
            if preview.is_active() and #vim.api.nvim_list_wins() > 1 then
              preview.hide()
            end
          end,
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end,
}
