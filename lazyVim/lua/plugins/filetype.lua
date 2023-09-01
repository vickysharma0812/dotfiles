return {
  "nathom/filetype.nvim",
  opts = {
    overrides = {
      extensions = {
        -- Set the filetype of *.inc files to fortran
        inc = "fortran",
        part = "fortran",
        tex = "tex",
        h = "c",
        c = "c",
        sh = "bash",
        mdx = "markdown",
      },
      literal = {
        -- Set the filetype of files named "MyBackupFile" to lua
        -- MyBackupFile = "lua",
      },
      complex = {
        -- Set the filetype of any full filename matching the regex to gitconfig
        -- [".*git/config"] = "gitconfig", -- Included in the plugin
      },

      --
      -- more details are here https://github.com/nathom/filetype.nvim
      --
      --
    },
  },
}
