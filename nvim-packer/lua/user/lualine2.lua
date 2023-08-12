local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("lualine not found!!")
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local function fg(name)
	return function()
		---@type {foreground?:number}?
		local hl = vim.api.nvim_get_hl_by_name(name, true)
		return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
	end
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = true,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return " " .. str .. ""
	end,
}

local filetype = {
	"filetype",
	icon_only = false,
	separator = "",
	padding = { left = 1, right = 0 },
}

local filename = {
	"filename",
	path = 0,
	symbols = { modified = "  ", readonly = "", unnamed = "" },
}

local filesize = {
	"filesize",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		-- theme = "gruvbox-baby",
		theme = "auto",
		component_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		section_separators = { left = " ", right = "" },
		-- component_separators = { left = " ", right = " " },
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { "branch" },
		lualine_c = {
			diagnostics,
			filetype,
			filename,
			filesize,
			{
				function()
					return require("nvim-navic").get_location()
				end,
				cond = function()
					return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
				end,
			},
		},
		lualine_x = {
      -- stylua: ignore
      {
        function()
          return require("noice").api.status.command.get()
        end,
        cond = function()
          return package.loaded["noice"] and require("noice").api.status.command.has()
        end,
        color = fg("Statement")
      },

      -- stylua: ignore
      {
        function()
          return require("noice").api.status.mode.get()
        end,
        cond = function()
          return package.loaded["noice"] and require("noice").api.status.mode.has()
        end,
        color = fg("Constant"),
      },
			--[[ {
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				color = fg("Special"),
			}, ]]
			diff,
			"encoding",
		},
		lualine_y = {
			location,
			{ "progress", separator = "", padding = { left = 1, right = 0 } },
		},
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
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
	extensions = {},
})
