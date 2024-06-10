if vim.g.loaded_nvim_notes == 1 then
	return
end

vim.g.loaded_nvim_notes = 1

vim.api.nvim_create_user_command("NvimNotes", function(opts)
	local nvim_notes = require("nvim_notes")
	if opts.fargs[1] == "add" then
		nvim_notes.add_note()
	elseif opts.fargs[1] == "view" then
		nvim_notes.view_notes()
	elseif opts.fargs[1] == "delete" then
		nvim_notes.delete_notes()
	else
		vim.api.nvim_err_writeln("Valid args: 'add' | 'view' | 'delete'")
	end
end, {
	nargs = 1,
})
