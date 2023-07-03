local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local util = require("lspconfig/util")
local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.graphql.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "graphql-lsp", "server", "-m", "stream" },
	filetypes = { "graphql", "gql", "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_dir = util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
})

-- go lsp configuration
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

-- disable inline diagnostic
vim.diagnostic.config({ virtual_text = false })
