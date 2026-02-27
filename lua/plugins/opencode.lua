return {
  "sudo-tee/opencode.nvim",
  cmd = { "Opencode" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
    "folke/snacks.nvim",
  },
  keys = {
    { "<leader>og", "<cmd>Opencode<cr>", desc = "Toggle OpenCode" },
    { "<leader>oi", "<cmd>Opencode open input<cr>", desc = "Open Input" },
    { "<leader>oo", "<cmd>Opencode open output<cr>", desc = "Open Output" },
    { "<leader>o/", "<cmd>Opencode quick_chat<cr>", desc = "Quick Chat" },
    { "<leader>od", "<cmd>Opencode diff open<cr>", desc = "Open Diff" },
    { "<leader>ot", "<cmd>Opencode toggle focus<cr>", desc = "Toggle Focus" },
    { "<leader>oq", "<cmd>Opencode close<cr>", desc = "Close" },
  },
  config = function()
    require("opencode").setup({
      keymap_prefix = "<leader>o",
      ui = {
        position = "right",
        input_position = "bottom",
        window_width = 0.40,
        icons = {
          preset = "nerdfonts",
        },
      },
    })
  end,
}
