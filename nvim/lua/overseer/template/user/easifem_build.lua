return {
  -- Required fields
  name = "easifem build",
  builder = function(params)
    local file = vim.fn.expand("%:p")
    -- local filename = vim.fn.expand("%:t")
    return {
      cmd = { "easifem" },
      args = { "lint", file },
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
