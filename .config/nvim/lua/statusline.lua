local custom_dracula = require("lualine.themes.dracula")
local background = "#44475a"

custom_dracula.normal.a.gui = ""
custom_dracula.normal.b.bg = background
custom_dracula.normal.c.bg = background

custom_dracula.insert.a.gui = ""
custom_dracula.insert.b.bg = background
custom_dracula.insert.c.bg = background

custom_dracula.visual.a.gui = ""
custom_dracula.visual.b.bg = background
custom_dracula.visual.c.bg = background

custom_dracula.replace.a.gui = ""
custom_dracula.replace.b.bg = background
custom_dracula.replace.c.bg = background

custom_dracula.command.a.gui = ""
custom_dracula.command.b.bg = background
custom_dracula.command.c.bg = background

custom_dracula.inactive.a.gui = ""
custom_dracula.inactive.b.bg = background
custom_dracula.inactive.c.bg = background

require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = custom_dracula,
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diagnostics", "filename" },
		lualine_c = {},
		lualine_x = { "fileformat", "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
