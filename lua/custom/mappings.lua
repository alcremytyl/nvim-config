local M = {}

M.disabled = {
  n = {
    ["<leader>f"] = "",
  }
}

M.custom = {
  n = {
    ['<leader>tt'] = { function()
      require("base46").toggle_transparency()
    end, "toggle transparency" },
  }
}

M.gitsigns = {
  n = {
    ["<leader>gs"] = { ":Telescope  git_stash <CR>", "Git stash"},
    ["<leader>gc"] = { ":Telescope git_commits <CR>", "Git commits"},
    ["<leader>gB"] = { ":Telescope git_branches <CR>", "Git branchdaaes"},

  }
}

-- M.obsidian = {
--   n = {
--     ["<leader>o"] = { ":Obsidian <CR>", "" },
--     ["<leader>o"] = { ":Obsidian <CR>", "" },
--     ["<leader>o"] = { ":Obsidian <CR>", "" },
--   }
-- }

M.ranger = {
  n = {
    ['<leader>fr'] = { ":Ranger <CR>", "Open ranger" }
  }
}

M.ufo = {
  n = {
     ['zp'] = { function()
      if not require('ufo').peekFoldedLinesUnderCursor() then
        vim.lsp.buf.hover()
      end
    end, "fold peek" }
  }
}

return M
