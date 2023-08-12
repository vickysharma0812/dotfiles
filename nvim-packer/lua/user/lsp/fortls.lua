local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	print("lspconfig not found")
	return
end

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	print("mason not found")
	return
end

mason.setup()

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	print("mason-lspconfig not found")
	return
end

mason_lspconfig.setup({
	ensure_installed = { "fortls" },
	automatic_installation = true,
})

--
-- Keymaps
--

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

--
-- highlight capabilities of lsp
--

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		print("using language servers highlight...")
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

--
-- document symbols in status lines
--

local function lsp_symbol_provide(client, bufnr)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentSymbolProvider then
		local status_ok, navic = pcall(require, "nvim-navic")
		if not status_ok then
			io.write("nvim-navic not found!!")
			return
		else
			navic.attach(client, bufnr)
		end
	end
end

--
-- attaching to buffer
--

local opts = {}

opts.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
	lsp_symbol_provide(client, bufnr)
end

--
-- completion settings
--

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
	print("cmp_nvim_lsp not found!!")
	return
else
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	opts.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

--
-- extending the opts and then calling lsp setup for forls
--

local fortls_ok, fortls_conf_opts = pcall(require, "user.lsp.settings.fortls")
if fortls_ok then
	opts = vim.tbl_deep_extend("force", fortls_conf_opts, opts)
end

lspconfig["fortls"].setup(opts)

---
--- null_ls setup for linting and formatting
---
