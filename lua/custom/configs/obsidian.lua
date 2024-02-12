return {
  dir = "~/Documents/obsidian/College",  -- no need to call 'vim.fn.expand' here
  disable_frontmatter = false,
  finder = "telescope.nvim",
  open_notes_in = "current",
  completion = {
    nvim_cmp = true,
    min_chars = 2,
    new_notes_location = "current_dir",
    prepend_note_id = true,
  },
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },
  backliks = {
    wrap = true
  },
  mappings = {}
}
