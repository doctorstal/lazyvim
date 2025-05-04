return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        protols = {
          cmd = { "protols", "--include-paths=/tmp/proto/" },
          root_dir = function(filename)
            return vim.fs.dirname(vim.fs.find("protols.toml", { path = filename, upward = true })[1])
              or vim.fs.dirname(vim.fs.find("truecaller", { path = filename, upward = true })[1])
              or vim.fs.dirname(vim.fs.find(".git", { path = filename, upward = true })[1])
          end,
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "protols", -- Protobuf support
      })
    end,
  },
}
