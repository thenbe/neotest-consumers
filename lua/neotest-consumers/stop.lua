local M = {}

-- Stop a test run from anywhere.
--- @param client neotest.Client
M.stop_global = function(client)
	local positions = client:running_positions()
	local position = positions[1]

	if position then
		-- if position is not empty/nil, stop the first one
		-- enables us to stop a test run from a different file
		local id = position.position:data().id
		require("neotest").run.stop(id)
	else
		-- fall back to default stop behavior
		require("neotest").run.stop()
	end
end

return M
