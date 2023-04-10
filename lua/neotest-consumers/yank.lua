local async = require("neotest.async")

local M = {}

-- Yank the test command
--- @param client neotest.Client
M.yank = function(client)
	local position = require("neotest-consumers.util").get_pos(client)
	if not position then
		return
	end

	local file = async.fn.expand("%:p")

	local adapter_name, adapter = client:get_adapter(file)

	local command = adapter.build_spec({
		tree = position,
	}).command

	-- convert to string
	local command_str = table.concat(command, " ")

	vim.fn.setreg("+", command_str)
end

return M
