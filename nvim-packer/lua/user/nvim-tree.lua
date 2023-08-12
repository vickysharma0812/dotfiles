local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!!!")
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	sync_root_with_cwd = false,
	respect_buf_cwd = true,
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		--height = 30,
		hide_root_folder = false,
		side = "left",
		--auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = { "<2-RightMouse>", "<C-]>" }, action = "" }, -- cd
				{ key = "<C-v>", action = "vsplit" }, -- vsplit
				{ key = "<C-x>", action = "split" }, -- split
				{ key = "<C-t>", action = "tabnew" }, -- tabnew
				{ key = "<BS>", action = "close_node" }, -- close_node
				{ key = "<Tab>", action = "preview" }, -- preview
				{ key = "D", action = "trash" }, -- trash
				{ key = "[e", action = "prev_diag_item" }, -- prev_diag_item
				{ key = "]e", action = "next_diag_item" }, -- next_diag_item
				{ key = "[c", action = "prev_git_item" }, -- prev_git_item
				{ key = "]c", action = "next_git_item" }, -- next_git_item
				{ key = "-", action = "dir_up" }, -- dir_up
				{ key = "s", action = "system_open" }, -- system_open
				{ key = "W", action = "W" }, -- collapse_all
				{ key = "g?", action = "toggle_help" }, -- toggle_help
				{ key = "d", action = "cd" }, -- remove
				{ key = "x", action = "remove" }, -- cut
				{ key = "t", action = "cut" },
				{ key = "<Space>p", action = "prev_diag_item" },
				{ key = "<Space>.", action = "next_diag_item" },
				{ key = "<Space>k", action = "prev_git_item" },
				{ key = "<Space>j", action = "next_git_item" },
				{ key = "u", action = "dir_up" },
				{ key = "'", action = "close_node" },
				{ key = '"', action = "collapse_all" },
				{ key = "?", action = "toggle_help" },
			},
		},
		number = false,
		relativenumber = false,
	},
	actions = {
		--quit_on_open = true,
		--window_picker = { enable = true },
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
})
