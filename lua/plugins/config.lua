return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        cql = "-- %s",
      },
    },
  },
  { "yioneko/nvim-type-fmt" },
  { "gurpreetatwal/vim-avro" },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
      },
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false,
  },
  {
    "Akzestia/nvim-cql",
    config = true,
    ft = "cql",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = false,
            },
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- opts.keymap = {
      --   ["<Tab>"] = {
      --     function(cmp)
      --       if cmp.snippet_active() then
      --         return cmp.accept()
      --       else
      --         return cmp.select_and_accept()
      --       end
      --     end,
      --     "snippet_forward",
      --     "fallback",
      --   },
      -- }
      opts.keymap = { preset = "super-tab" }

      opts.signature = { enabled = true }
      opts.sources = {
        providers = {
          path = {
            opts = {
              get_cwd = function(_)
                return vim.fn.getcwd()
              end,
            },
          },
        },
      }
      opts.completion = {}
      opts.completion.list = {}
      opts.completion.list.selection = { preselect = true, auto_insert = false }
      opts.completion.accept = { auto_brackets = { enabled = false } }
      opts.completion.documentation = { auto_show = true, auto_show_delay_ms = 500 }

      return opts
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
  },
}
