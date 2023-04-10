local M = {}

--- @param client neotest.Client
M.consumers = function(client)
	return {
		yank = function()
			require("neotest-consumers.yank").yank(client)
		end,

		output_or_attach = function()
			require("neotest-consumers.output").output_or_attach(client)
		end,

		stop_global = function()
			require("neotest-consumers.stop").stop_global(client)
		end,
	}
end

return M
