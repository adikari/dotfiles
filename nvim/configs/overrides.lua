local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"graphql",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"tailwindcss-language-server",
		"typescript-language-server",
		"deno",
		"graphql-language-service-cli",
		"yaml-language-server",
		"json-lsp",

		-- c/cpp stuff
		"clangd",
		"clang-format",
	},
}

M.nvimtree = {
	filters = {
		dotfiles = true,
	},
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
