return {
  "stevearc/overseer.nvim",
  lazy = false,
  opts = function()
    return {
      templates = {
        "builtin",
        "user.easifem_build",
        "user.run_script",
        "user.f90_build",
      },
      component_aliases = {
        default = {
          "on_output_summarize",
          "on_exit_set_status",
          { "on_complete_notify", statuses = { "FAILURE" }, on_change = true },
          { "on_complete_dispose", statuses = { "SUCCESS", "FAILURE" } },
          { "on_result_diagnostics_quickfix", open = true },
          "on_result_diagnostics",
        },
      },
    }
  end,
  -- opts = {
  -- },
}
