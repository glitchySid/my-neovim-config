-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "lua",
  "cssls",
  "rust_analyzer",
  "pyright",
  "docker_compose_language_service",
  "tailwindcss",
  "eslint",
  "clangd",
  "ruff",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript

lspconfig.denols.setup {
  on_init = nvlsp.on_init,
  init_options = {
    lint = true,
  },
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "package.json"),
}


lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
    pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
  root_dir = require("lspconfig").util.root_pattern("pyproject.toml", "setup.py", "requirements.txt", "Pipfile", ".git")
}

-- lspconfig.ruff.setup {
--   init_options = {
--     settings = {
--       fix = true,
--       interpreter = { uv_venv_path },
--       format = {
--         preview = true,
--       },
--     },
--   },
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   root_dir = lspconfig.util.root_pattern("pyproject.toml", "poetry.lock", "uv.lock"),
-- }

-- nvim_lsp.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   root_dir = nvlsp.util.root_pattern("package.json"),
--   single_file_support = false
-- }

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}

lspconfig.tailwindcss.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}


lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  settings ={
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true
      }
    },
  }
}
