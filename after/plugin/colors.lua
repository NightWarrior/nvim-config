
function ColorMyPencils(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)
	require('onedark').setup {
		transparent = true
	}

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
