local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "deno_fmt" },
    html = { "deno_fmt" },
    javascript = { "deno_fmt" },
    typescript = { "deno_fmt" },
    json = { "deno_fmt" },
    jsonc = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },
    python = {"ruff_format", "ruff_fix"},
    rust = {"rustfmt"},
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
