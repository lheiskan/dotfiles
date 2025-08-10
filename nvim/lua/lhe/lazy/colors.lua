function SetColors(color) 
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		-- vim.cmd("colorscheme rose-pine")
		SetColors()
	end
}

-- built in color schemes
-- blue
-- darkblue
-- delek
-- desert
-- elflord
-- evening
-- habamax
-- industry
-- koehler
-- lunaperche
-- morning
-- murphy
-- pablo
-- peachpuff
-- quiet
-- retrobox
-- ron
-- shine
-- slate
-- sorbet
-- torte
-- unokai
-- wildcharm
-- zaibatsu
-- zellner
