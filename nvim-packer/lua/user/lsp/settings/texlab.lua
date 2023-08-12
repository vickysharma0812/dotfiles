return {
	settings = {
		texlab = {
			auxDirectory = "build",
			diagnosticsDelay = 50,
			build = {
				executable = "latexmk",
				onSave = true,
				args = {
					"-pdf",
					"-pdflua",
					"-quiet",
					"-interaction=nonstopmode",
					"-synctex=1",
					"-shell-escape",
					-- "-pvc",
					"-f",
					"-outdir=build",
					"%f",
				},
			},
			forwardSearch = {
				args = { "--synctex-forward", "%l:1:%f", "%p" },
				executable = "zathura",
			},
			chktex = { onOpenAndSave = true, onEdit = false },
			formatterLineLength = 120,
		},
	},
}
