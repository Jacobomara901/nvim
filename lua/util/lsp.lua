local mapkey = require("util.keymapper").mapvimkey

local M = {}

function FormatFunction()
	vim.lsp.buf.format({
		async = true,
		range = {
			["start"] = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
	})
end

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapkey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
	mapkey("<leader>gd", "Lspsaga peek_definition", "n", opts) -- peak definition
	mapkey("<leader>gD", "Lspsaga goto_definition", "n", opts) -- go to definition
	mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
	mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
	mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
	mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

	vim.keymap.set("v", "<Leader>1f", "<cmd>lua FormatFunction()<CR>", { noremap = true })

	if client.name == "pyright" then
		mapkey("<leader>oi", "PyrightOrganizeImports", "n", opts) -- organise imports
		mapkey("<leader>db", "DapToggleBreakpoint", "n", opts) -- toggle breakpoint
		mapkey("<leader>dr", "DapContinue", "n", opts) -- continue/invoke debugger
		mapkey("<leader>dt", "lua require('dap-python').test_method()", "n", opts) -- run tests
	end
end

return M
