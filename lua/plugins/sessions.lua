return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = vim.opt.sessionoptions:get() },
		keys = {
			{ "<leader>ss", "<cmd>lua require('persistence').save()<cr>", desc = "Save session" },
			{ "<leader>sl", "<cmd>lua require('persistence').load()<cr>", desc = "Load session" },
			{ "<leader>sd", "<cmd>lua require('persistence').stop()<cr>", desc = "Stop auto-save" },
		},
	},
}
