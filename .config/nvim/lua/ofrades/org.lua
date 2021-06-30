require("orgmode").setup {
	org_agenda_files = { "~/notes/*" },
	org_default_notes_file = "~/notes/refile.org",
	mappings = {
		global = {
			org_agenda = "<leader>oa",
			org_capture = "<leader>oc",
		},
	},
}
