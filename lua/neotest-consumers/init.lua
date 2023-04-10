local M = {}

--- @param client neotest.Client
M.consumers = function(client)
	return {
		yank = function()
			require("neotest-consumers.yank").yank(client)
		end,
	}
end

return M
