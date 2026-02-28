return {
	"folke/snacks.nvim",

	config = function()
		require("snacks").setup({
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "keys" }, -- This automatically lists your common keys
					{
						section = "startup",
						padding = 1,
					},
					{
						icon = "󰊤 ",
						title = "Github Repos",
						section = "keys",
						-- This filters your ACTUAL keymaps for only Git and NeoTree ones
						filter = function(item)
							return item.desc and (item.desc:match("Git") or item.desc:match("NeoTree"))
						end,
					},
				},
			},

      vim.keymap.set("n", "<leader>d", function() Snacks.dashboard.open() end, { desc = "Open Dashboard" })
		})
	end,
}
