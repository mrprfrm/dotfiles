local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local function get_typescript_server_path(root_dir)
	local ts_path
	local function check_dir(path)
		ts_path = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(ts_path) then
			return path
		end
	end
	if util.search_ancestors(root_dir, check_dir) then
		return ts_path
	end
end

return {
	html = {},
	emmet_ls = {},
	volar = {
		root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js"),
		on_new_config = function(new_config, new_root_dir)
			new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
		end,
	},
	eslint = {},
	tsserver = {},
	cssls = {},
	tailwindcss = {},
	rust_analyzer = {},
	pyright = {
		root_dir = lspconfig.util.root_pattern("WORKSPACE", "pyproject.toml"),
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "off",
				},
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
					-- [vim.fn.stdpath("config") .. "/lua"] = true,
					-- TODO: fix the warning vim is not defined
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	},
}
