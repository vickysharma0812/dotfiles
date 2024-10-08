return {
  "renerocksai/telekasten.nvim",
  enabled = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    home = vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/"),
    dailies = vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/") .. "/" .. "DailyNotes",
    weeklies = vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/") .. "/" .. "WeeklyNotes",
    templates = vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/") .. "/" .. "Templates",
    extension = ".md",
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,
    template_new_note = vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/") .. "/" .. "Templates/new_note.md",
    template_new_daily = vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/") .. "/" .. "Templates/daily.md",
    template_new_weekly = vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/") .. "/" .. "Templates/weekly.md",
    command_palette_theme = "dropdown",
    show_tags_theme = "dropdown",
    valts = {
      vim.fn.expand("~/Documents/easifemDocs/docs/"),
      vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/Notes/"),
      vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/VikasSharma/"),
      vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/ToDo/"),
      vim.fn.expand("~/OneDrive/Knowledge/LectureNotes/FEM-Spaces/"),
    },
  },
}
