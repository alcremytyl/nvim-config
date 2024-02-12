return {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      local lspconfig = require"lspconfig"
      local on_attach = require"plugins.configs.lspconfig".on_attach
      local capabilities = require"plugins.configs.lspconfig".capabilities
      local servers = {
        'bashls',
        'jdtls',
        'lua_ls',
        'marksman',
        'pyright',
        'tailwindcss',
      }
      for _, i in pairs(servers) do
        lspconfig[i].setup{
          on_attach = on_attach,
          capabilities=capabilities
        }
      end
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "markdown", "markdown_inline", "html", "python", "rust" },
      highlight = {
        enabled = true,
        additional_vim_regex_highlighting = { "markdown" }
      }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server", -- NodeJS >=v16
        "black",
        "debugpy",
        "jdtls",
        "lua-language-server",
        "marksman",
        "pyright",
        "rust-analyzer",
        "tailwindcss-language-server",
        "taplo",
        -- "mypy",
        -- "ruff",
        -- "shellcheck",
      }
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function ()
      require "custom.configs.telescope"
    end
  },
  -- {
  -- 'nvimtools/none-ls.nvim',
  --   ft = {'python'},
  --   opts = function ()
  --     return require("custom.configs.null-ls")
  --   end
  -- },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = require("custom.configs/rust-tools"),
  },
  {
    'andweeb/presence.nvim',
    lazy = false,
    config = function ()
      require("presence").setup({
        neovim_image_text = "NvChad BTW",
        buttons = {
          { label = "GitHub", url = "https://github.com/1SlenderGaming1" }
        }
      })
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function ()
      vim.fn["mkdp#util#install"]()
    end
  },
  { "kevinhwang91/promise-async" },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = false,
    opts = require("custom.configs.ufo"),
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    opts = require("custom.configs.todo-comments"),
    init = function()
      require("core.utils").lazy_load "todo-comments.nvim"
    end,
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },
  { "rbgrouleff/bclose.vim" },
  {
    "francoiscabrol/ranger.vim",
    dependencies = "rbgrouleff/bclose.vim",
    lazy = false
  },
  {
    -- Tim Pope I kneel
    "tpope/vim-surround",
    lazy=false
  },
  { "m00qek/baleia.nvim" },
  {
    "samodostal/image.nvim",
    opts = {
      render = {
        min_padding = 5,
        show_label = true,
        show_image_dimensions = true,
        use_dither = true,
        foreground_color = false,
        background_color = false
      },
      events = {
        update_on_nvim_resize = true,
      },
    },
    lazy = false,
    dependencies={"m00qek/baleia.nvim", "nvim-lua/plenary.nvim"}
  },
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    mappings = {},
    opts = require("custom.configs.obsidian"),
    event = {
      "BufReadPre /home/mytyl/Documents/obsidian/College/**.md",
      "BufNewFile /home/mytyl/Documents/obsidian/College/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      },
  },
  -- highlighting 
  { "kovetskiy/sxhkd-vim", ft="sxhkd"},
  { "Fymyte/rasi.vim", ft='rasi' },

}
