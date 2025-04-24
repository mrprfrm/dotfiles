return {
	cssmodules_ls = function()
		require("lspconfig").cssmodules_ls.setup({
			capabilities,
			init_options = {
				camelCase = false,
			},
		})
	end,
	-- eslint = function()
	-- 	require("lspconfig").eslint.setup({
	-- 		capabilities,
	-- 		settings = {
	-- 			codeActionOnSave = { enable = true, mode = "all" },
	-- 		},
	-- 	})
	-- end,
	jsonls = function()
		require("lspconfig").jsonls.setup({
			capabilities,
			init_options = { provideFormatter = false },
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})
	end,
	lua_ls = function()
		require("lspconfig").lua_ls.setup({
			capabilities,
			settings = {
				Lua = {
					completion = { callSnippet = "Replace" },
					format = { enable = false },
					runtime = { version = "LuaJIT" },
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
				},
			},
		})
	end,
	rust_analyzer = function()
		require("lspconfig").rust_analyzer.setup({
			capabilities,
			cmd = { "rustup", "run", "stable", "rust-analyzer" },
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})
	end,
	stylelint_lsp = function()
		require("lspconfig").stylelint_lsp.setup({
			capabilities,
			filetypes = { "css" },
			settings = {
				stylelintplus = { autoFixOnFormat = true },
			},
		})
	end,
	tsserver = function()
		require("lspconfig").tsserver.setup({
			capabilities,
			settings = {
				completions = { completeFunctionCalls = true },
			},
		})
	end,
	yamlls = function()
		require("lspconfig").yamlls.setup({
			settings = {
				redhat = { telemetry = { enabled = false } },
				yaml = { keyOrdering = false },
			},
		})
	end,
}
