local M = {}

-- Resiliently view test output from any file.
-- If a test is running, attach to it.
-- Else, view the output of the most recent test.
--- @param client neotest.Client
M.output_or_attach = function(client)
	local positions = client:running_positions()
	local position = positions[1]

	if position then
		-- if position is not empty/nil, attach to the first one
		-- ALT: use interactive mode
		-- ALT: use output_panel
		local id = position.position:data().id
		require("neotest").run.attach(id)
		-- require("neotest").run.attach({ interactive = true })
	else
		-- open output of last run
		require("neotest").output.open({ enter = false, last_run = true, auto_close = true })
	end
end

return M
