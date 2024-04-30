return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers", -- This is the important bit!
		config = true,
		lazy = true,
		enabled = false,
		ft = "neorg",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/neorg-telescope",
			"max397574/neorg-kanban",
			"max397574/neorg-contexts",
		},
	},
	{
		"nvim-orgmode/orgmode",
		lazy = true,
		ft = "org",
		enabled = false,
		config = function()
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup({
				org_agenda_files = { "~/MEGAsync/org/*" },
				org_default_notes_file = "~/Megasync/org/refile.org",
			})
		end,
	},
	{
		"akinsho/org-bullets.nvim",
		lazy = true,
		ft = "org",
		enabled = false,
		config = true,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		--ft = "markdown",
		--Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		event = {
			-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
			"BufReadPre "
				.. vim.fn.expand("~")
				.. "/Nextcloud/Noumiso/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Nextcloud/Noumiso/**.md",
		},
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			-- see below for full list of optional dependencies 👇
		},
		opts = {
			note_id_func = function(title)
				local id = os.date("%Y%m%d%H%M") .. "-"
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					id = id .. title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						id = id .. string.char(math.random(65, 90))
					end
				end
				return id
			end,
			disable_frontmatter = false,
			workspaces = {
				{
					name = "Noumiso",
					path = "~/Nextcloud/Noumiso",
				},
			},
			templates = {
				subdir = "_templates",
			},
			attachments = {
				img_folder = "gfx",
			},
		},
	},
}
