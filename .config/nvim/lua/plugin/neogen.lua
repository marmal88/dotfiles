require('neogen').setup({
	snippet_engine = "mini",
	languages = {
		python = {
			template = {
				annotation_convention = "google_docstrings"
			}
		}
	}
})
