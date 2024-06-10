local M = {}

local note_file = vim.fn.stdpath("data") .. "/nvim_notes.txt"

M.add_note = function()
	local note = vim.fn.input("Enter your note: ")
	vim.api.nvim_out_write("\n")

	if note ~= "" then
		local file = io.open(note_file, "a")

		if not file then
			print("Error opening/creating file")
			return
		end

		file:write(note .. "\n")
		file:close()

		print("Note added!")
	else
		print("No note entered..")
	end
end

M.view_notes = function()
	local file = io.open(note_file, "r")

	if not file then
		print("No notes found...")
		return
	end

	local contents = file:read("*a")
	file:close()

	vim.api.nvim_out_write("Nvim Notes: \n")
	vim.api.nvim_out_write(contents)
end

M.delete_notes = function()
	os.remove(note_file)
	print("Deleted all notes...")
end

return M
