return require('blink.cmp').setup({
	sources = { default = {
			'snippets', -- snippets from snippets directory
			'lsp',  -- completions from language server
			'path', -- completions from file path
			'buffer' -- words already present in the buffer
		},
	},
	snippets = { preset = 'mini_snippets' },
	-- snippets = { friendly_snippets = true },
	completion = {
		menu = {
			auto_show = true,
			auto_show_delay_ms = 300,
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind" },
				},
			}
		},
		documentation = {
			auto_show = true,
			window = { border = 'single' },
		},
		trigger = { show_on_keyword = true },
		list = { selection = {
				preselect = false,
				auto_insert = true
			},
		},
		ghost_text = { enabled = true }
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = {
		preset = 'none',
		['<C-p>'] = { 'show', 'hide', 'fallback' },
		-- Combine select menu and snippet 
		['<S-Tab>'] = { 'select_prev', 'snippet_backward','fallback'},
		['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
		-- documentation
		['<C-o>'] = { 'show_documentation', 'hide_documentation' },
		['<C-j>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
		-- signature
		['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
		['<C-k>'] = { 'select_and_accept' }
	},
	-- sources
	-- displays the function signature
	signature = { enabled = true },
})
