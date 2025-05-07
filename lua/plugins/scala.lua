return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        metals = function(_, opts)
          local metals = require("metals")
          local metals_config = vim.tbl_deep_extend("force", metals.bare_config(), opts)
          metals_config.on_attach = LazyVim.has("nvim-dap") and metals.setup_dap or nil
          metals_config.settings = {
            testUserInterface = "Test Explorer",
          }

          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt" },
            callback = function()
              metals.initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
          })
          return true
        end,
      },
    },
  },
  {
    "neovim/nvim-dap",
    opts = function()
      local dap = require("dap")
      if not dap.adapters["sbt"] then
        require("dap").adapters["sbt"] = {
          type = "server",
          host = "localhost",
          port = "5005",
          executable = {
            command = "sbt",
            args = {
              "runLocally",
            },
          },
          options = {
            initialize_timeout_sec = 30,
          },
        }
      end
    end,
  },
}
