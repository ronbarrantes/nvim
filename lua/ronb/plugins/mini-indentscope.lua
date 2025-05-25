return {
	"echasnovski/mini.indentscope",
	version = false,

	opts = {
		draw = {
			delay = 100,
			animation = function(s, n)
				return 10
			end,
		},
		options = { try_as_border = true },
		symbol = "│",
	},
}
