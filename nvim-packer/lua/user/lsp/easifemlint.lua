local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local easifemlint = h.make_builtin({
	name = "easifemlint",
	meta = { url = "", description = "" },
	method = methods.internal.DIAGNOSTICS_ON_SAVE,
	filetypes = { "fortran" },
	factory = h.generator_factory,
	generator_opts = {
		command = "gcc",
		args = {
			"-o /dev/null",
			"-c",
			"-ffree-form",
			"-ffree-line-length-none",
			"-std=f2008",
			"-fimplicit-none",
			"-fbounds-check",
			"-Wextra",
			"-Wall",
			"-Wimplicit-interface",
			"-I",
			os.getenv("EASIFEM_EXTPKGS") .. "/include",
			os.getenv("EASIFEM_BASE") .. "/include",
			os.getenv("EASIFEM_CLASSES") .. "/include",
			os.getenv("EASIFEM_IDE") .. "/include",
			"-J",
			os.getenv("EASIFEM_IDE") .. "/include",
			"$FILENAME",
		},
		to_stdin = false,
		from_stderr = true,
		format = "raw",
		on_output = h.diagnostics.from_pattern({
			pattern = [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]],
			groups = { "file", "row", "col", "severity", "message" },
			severities = {
				["fatal error"] = h.diagnostics.severities.error,
				["error"] = h.diagnostics.severities.error,
				["note"] = h.diagnostics.severities.information,
				["warning"] = h.diagnostics.severities.warning,
			},
		}),
	},
})
