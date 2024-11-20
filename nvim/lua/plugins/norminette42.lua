return {
	"hardyrafael17/norminette42.nvim",
	config = function()
	local norminette = require("norminette")
	norminette.setup({
			runOnSave = true,
			maxErrorsToShow = 5,
			active = true,
	})
end,
}

--[[
return {
    "hardyrafael17/norminette42.nvim",
    config = function()
        if not vim.g.norminette42_active then
            return
        end
        local norminette = require("norminette")
        norminette.setup({
            runOnSave = true,
            maxErrorsToShow = 5,
            active = true,
        })
    end,
}

return {
    "hardyrafael17/norminette42.nvim",
    config = function()
        local norminette = require("norminette")

        -- Setup the plugin, respecting `vim.g.norminette42_active`
        norminette.setup({
            runOnSave = vim.g.norminette42_active or false, -- Default to false if not set
            maxErrorsToShow = 5,
            active = vim.g.norminette42_active or false,
        })

        -- Optionally, add a message to notify plugin status
        vim.api.nvim_create_autocmd("BufWritePost", {
            callback = function()
                if not vim.g.norminette42_active then
                    print("Norminette42 is deactivated")
                end
            end,
        })
    end,
}

--]]
