return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    vim.keymap.set("n", "<leader>d", function()
      Snacks.dashboard.open()
    end, { desc = "Open Dashboard" })

    -- Picker keymaps (replaces telescope)
    vim.keymap.set("n", "<leader>f", function()
      Snacks.picker.files()
    end, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>g", function()
      Snacks.picker.grep()
    end, { desc = "Grep" })
    vim.keymap.set("n", "gd", function()
      Snacks.picker.lsp_definitions()
    end, { desc = "Goto Definition" })
    vim.keymap.set("n", "gr", function()
      Snacks.picker.lsp_references()
    end, { desc = "References" })

    -- Close dashboard when Neo-tree opens so they don't conflict
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree",
      callback = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == "snacks_dashboard" then
            local wins = vim.fn.win_findbuf(buf)
            for _, win in ipairs(wins) do
              if #vim.api.nvim_list_wins() > 1 then
                vim.api.nvim_win_close(win, true)
              else
                vim.api.nvim_win_set_buf(win, vim.api.nvim_create_buf(false, true))
              end
            end
            if vim.api.nvim_buf_is_valid(buf) then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end
      end,
    })
  end,
}
