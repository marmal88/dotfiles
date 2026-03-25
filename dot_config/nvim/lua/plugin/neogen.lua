require('neogen').setup({
	enabled = true,
	input_after_comment = true,
	snippet_engine = "mini",
	languages = {
		python = { template = { annotation_convention = "google_docstrings" } },
		lua = { template = { annotation_convention = "emmylua" } }
	},
})

