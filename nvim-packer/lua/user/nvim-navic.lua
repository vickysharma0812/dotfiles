local status_ok, navic = pcall(require, "nvim-navic")

if not status_ok then
	io.write("nvim-navic not found!!")
	return
end

navic.setup({
	-- init = function()
	-- 	vim.g.navic_silence = true
	-- 	require("util").on_attach(function(client, buffer)
	-- 		if client.server_capabilities.documentSymbolProvider then
	-- 			require("nvim-navic").attach(client, buffer)
	-- 		end
	-- 	end)
	-- end,
	separator = " ",
	highlight = true,
	depth_limit = 5,
	-- safe_output = true,
})
