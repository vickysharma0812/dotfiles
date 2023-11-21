-- /home/stevearc/.config/nvim/lua/overseer/template/user/run_script.lua
return {
  name = "run script",
  builder = function()
    local file = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%:t")
    local cmd = { file }
    if vim.bo.filetype == "go" then
      cmd = { "go", "run", file }
    end
    if vim.bo.filetype == "fortran" then
      cmd = {
        "gfortran",
        "-I/Users/easifem/.easifem/install/easifem/base/include",
        "-I/Users/easifem/.easifem/install/easifem/extpkgs/include",
        "-J/Users/easifem/.easifem/ide/include",
        "-ffree-form",
        "-ffree-line-length-none",
        "-std=f2018",
        "-fimplicit-none",
        "-Waliasing",
        "-Wall",
        "-Wampersand",
        "-Warray-bounds",
        "-Wc-binding-type",
        "-Wcharacter-truncation",
        "-Wconversion",
        "-Wdo-subscript",
        "-Wfunction-elimination",
        "-Wimplicit-interface",
        "-Wimplicit-procedure",
        "-Wintrinsic-shadow",
        "-Wuse-without-only",
        "-Wintrinsics-std",
        "-Wline-truncation",
        "-Wno-align-commons",
        "-Wno-overwrite-recursive",
        "-Wno-tabs",
        "-Wreal-q-constant",
        "-Wsurprising",
        "-Wunderflow",
        "-Wunused-parameter",
        "-Wrealloc-lhs",
        "-Wrealloc-lhs-all",
        "-Wtarget-lifetime",
        "-pedantic",
        "-pedantic-errors",
        "-c",
        file,
        "-o",
        "/Users/easifem/.easifem/ide/include/" .. filename .. ".o",
      }
    end
    return {
      cmd = cmd,
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
  condition = {
    filetype = { "sh", "python", "go", "fortran" },
  },
}
