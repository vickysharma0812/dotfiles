local status_ok, pkg = pcall(require, "neovim-tasks")
if not status_ok then
  io.write("neovim-tasks not found!")
  return
end

local Path = require('plenary.path')

pkg.setup({
  default_params = {                                                                  -- Default module parameters with which `neovim.json` will be created.
    cmake = {
      cmd = 'cmake',                                                                  -- CMake executable to use, can be changed using `:Task set_module_param cmake cmd`.
      build_dir = tostring(Path:new('temp', 'neovim', 'build', '{os}-{build_type}')), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
      build_type = 'Debug',                                                           -- Build type, can be changed using `:Task set_module_param cmake build_type`.
      dap_name = 'lldb',                                                              -- DAP configuration name from `require('dap').configurations`. If there is no such configuration, a new one with this name as `type` will be created.
      args = {                                                                        -- Task default arguments.
        configure = {
          '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1',
          '-G', 'Ninja',
          '-D', 'USE_OpenMP:BOOL=ON',
          '-D', 'BUILD_SHARED_LIBS:BOOL=ON',
          '-D', 'USE_PLPLOT:BOOL=ON',
          '-D', 'CMAKE_INSTALL_PREFIX:PATH=${EASIFEM_BASE}',
          '-D', 'USE_BLAS95:BOOL=ON',
          '-D', 'USE_LAPACK95:BOOL=ON',
          '-D', 'USE_FFTW:BOOL=ON',
          '-D', 'USE_GTK:BOOL=OFF',
          '-D', 'USE_ARPACK:BOOL=ON',
          '-D', 'USE_SUPERLU:BOOL=ON',
          '-D', 'USE_LIS:BOOL=ON',
          '-D', 'USE_PARPACK:BOOL=OFF',
          '-D', 'USE_METIS:BOOL=OFF',
          '-D', 'USE_Int32:BOOL=ON',
          '-D', 'USE_Real64:BOOL=ON',
          '-D', 'COLOR_DISP:BOOL=OFF'
        },
      },
    },
  },
  save_before_run = true,      -- If true, all files will be saved before executing a task.
  params_file = 'neovim.json', -- JSON file to store module and task parameters.
  quickfix = {
    pos = 'botright',          -- Default quickfix position.
    height = 12,               -- Default height.
  },
  dap_open_command = false     --function() return require('dap').repl.open() end, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
})
