-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "easifemBase build",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "cmake" },
      args = { file },
      cwd = vim.fn.expand("~/Dropbox/easifem/easifem-base/"),
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "fortran" },
  },
}
