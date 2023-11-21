return {
  -- Required fields
  name = "easifem build",
  builder = function(params)
    local file = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%:t")
    return {
      cmd = { "gfortran" },
      args = {
        "-DAPPLE",
        "-DASCII_SUPPORTED",
        "-DDarwin_SYSTEM",
        "-DUCS4_SUPPORTED",
        "-DUSE_APPLE_NativeBLAS",
        "-DUSE_ARPACK",
        "-DUSE_BLAS95",
        "-DUSE_CMAKE",
        "-DUSE_FFTW",
        "-DUSE_Int32",
        "-DUSE_LAPACK95",
        "-DUSE_LIS",
        "-DUSE_NativeBLAS",
        "-DUSE_OpenMP",
        "-DUSE_PLPLOT",
        "-DUSE_Real64",
        "-DUSE_SuperLU",
        "-D_ASCII_SUPPORTED",
        "-D_R16P",
        "-D_UCS4_SUPPORTED",
        "-DeasifemBase_EXPORTS",
        "-I/opt/homebrew/include",
        "-I/opt/homebrew/Cellar/plplot/5.15.0_4/lib/fortran/modules/plplot",
        "-I" .. os.getenv("EASIFEM_INSTALL_DIR") .. "/easifem/extpkgs/include",
        "-I" .. os.getenv("EASIFEM_INSTALL_DIR") .. "/easifem/extpkgs/include/arpack",
        "-I" .. os.getenv("EASIFEM_INSTALL_DIR") .. "/easifem/base/include",
        "-I" .. os.getenv("EASIFEM_INSTALL_DIR") .. "/easifem/classes/include",
        "-I" .. os.getenv("EASIFEM_INSTALL_DIR") .. "/easifem/kernels/include",
        "-I" .. os.getenv("EASIFEM_INSTALL_DIR") .. "/easifem/materials/include",
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
      },
      name = "easifem",
      cwd = vim.fn.expand("%:h"), -- "/tmp",
      env = {},
      components = {
        "default",
        { "on_complete_notify", statuses = { "FAILURE" }, on_change = true },
        { "on_complete_dispose", statuses = { "SUCCESS", "FAILURE", "CANCELED" }, timeout = 30 },
        { "on_output_quickfix", open = false, set_diagnostics = true },
        { "restart_on_save" },
        { "on_result_diagnostics", virtual_text = true },
        { "on_exit_set_status", success_codes = { 0 } },
        { "on_output_parse", problem_matcher = "$gcc" },
      },
      condition = {
        filetype = { "fortran" },
      },
    }
  end,
  -- Optional fields
  desc = "Build script for easifem",
  -- Tags can be used in overseer.run_template()
  -- tags = { overseer.TAG.BUILD },
  params = {
    -- See :help overseer-params
  },
  -- Determines sort order when choosing tasks. Lower comes first.
  priority = 50,
  -- Add requirements for this template. If they are not met, the template will not be visible.
  -- All fields are optional.
  condition = {
    filetype = { "fortran" },
    -- dir = {
    --   os.getenv("easifem"),
    --   os.getenv("base"),
    --   os.getenv("classes"),
    --   os.getenv("materials"),
    --   os.getenv("kernels"),
    --   os.getenv("tests"),
    --   os.getenv("elasticity"),
    -- },
    -- Arbitrary logic for determining if task is available
    callback = function(search)
      print(vim.inspect(search))
      return true
    end,
  },
}

--       components = { { "on_output_quickfix", open = true }, "default" },
