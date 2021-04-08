local api = vim.api
local fn = vim.fn

local prettier = {
  function()
    return {
      exe = "prettier",
      args = {
        "--stdin-filepath",
        api.nvim_buf_get_name(0)
      },
      stdin = true
    }
  end
}

local luafmt = {
  function()
    return {
      exe = "luafmt",
      args = {
        "--indent-count=2",
        "--stdin"
      },
      stdin = true
    }
  end
}

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = prettier,
      javascriptreact = prettier,
      typescript = prettier,
      typescriptreact = prettier,
      json = prettier,
      css = prettier,
      html = prettier,
      svelte = prettier,
      vue = prettier,
      lua = luafmt
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.vue,*.lua FormatWrite
augroup END
]],
  true
)
