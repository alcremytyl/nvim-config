-- local theme16 = require("base46").get_theme_tb "base_16"
local theme30 = require("base46").get_theme_tb "base_30"
--
-- TODO 
-- INFO
-- FIX 
-- PERF 
-- WARN 
-- TEST 
return {
  keywords = {
    FIX =  { icon = " ", color = "error", alt = { "FIXME", "BUG", "ISSUE" }},
    TODO = { icon = "󰮱 ", color = "todo" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "FAILED" }},
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }},
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED" }},
  },
  gui_style = { fg = "NONE", bg = "BOLD" },
  merge_keywords = true,
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = false, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    -- pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    pattern = [[.*<(KEYWORDS)(:|;|\s+|\.|,|;|$)]], -- same but don't strictly require the : after the keyword
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {
        "TelescopePrompt",
        "TelescopeResults",
        "help",
        "lazy",
        "lspinfo",
        "mason",
        "nvcheatsheet",
        "nvdash",
        "terminal",
        'nerdtree',
        'unite',
        'OverseerForm',
        'OverseerList',
    }, -- list of file types to exclude highlighting TODO fill
    throttle = 200,
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { theme30.red },
    warning = { theme30.orange },
    hint = { theme30.grey_fg2 },
    test = { theme30.green },
    todo = { theme30.purple }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },

}
