return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"nvim-telescope/telescope-file-browser.nvim",
				config = function()
					require("telescope").load_extension("file_browser")
				end,
			},
			{
				"ThePrimeagen/harpoon",
				config = function()
					require("harpoon").setup()
					local mark = require("harpoon.mark")
					local ui = require("harpoon.ui")
					vim.keymap.set("n", "<leader>ha", mark.add_file)
					-- vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu)

					require("telescope").load_extension("harpoon")
					vim.keymap.set("n", "<leader>ht", ":Telescope harpoon marks<CR>")
					-- vim.keymap.set("n", "<leader>ht", builtin.toggle_quick_menu) // RNW TODO :Telescope harpoon marks
				end,
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>s/", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "gr", builtin.lsp_references, {})
			local actions = require("telescope.actions")
			require("telescope").setup({

				defaults = {
					color_devicons = true,
					path_display = { "truncate" },
					layout_config = {
						-- width = 0.8,
						-- prompt_position = "top",
						-- preview_width = 0.5,
					},
					sorting_strategy = "descending",
					prompt_prefix = "=> ",
					mappings = {
						i = {
							["<c-j>"] = actions.move_selection_next,
							["<c-k>"] = actions.move_selection_previous,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<CR>"] = actions.select_default,
						},
						n = {
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
					pickers = {
						find_files = {
							hidden = true,
						},
						live_grep = {
							--@usage don't include the filename in the search results
							only_sort_text = true,
						},
						grep_string = {
							only_sort_text = true,
						},
						buffers = {
							initial_mode = "normal",
							mappings = {
								i = {
									["<C-d>"] = actions.delete_buffer,
								},
								n = {
									["dd"] = actions.delete_buffer,
								},
							},
						},
						planets = {
							show_pluto = true,
							show_moon = true,
						},
						git_files = {
							hidden = true,
							show_untracked = true,
						},
						colorscheme = {
							enable_preview = true,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					-- fzf = {
					-- 	fuzzy = true, -- false will only do exact matching
					-- 	override_generic_sorter = true, -- override the generic sorter
					-- 	override_file_sorter = true, -- override the file sorter
					-- 	case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- 	-- the default case_mode is "smart_case"
					-- },
				},
			})
			require("telescope").load_extension("ui-select")
			-- require("telescope").load_extension("fzf")
			-- require("telescope").load_extension("file_browser")
			-- require("telescope").load_extension("harpoon")
		end,
	},
}
