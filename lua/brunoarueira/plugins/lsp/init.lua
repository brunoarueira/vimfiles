local status, lsp_zero = pcall(require, 'lsp-zero')

if (not status) then
  return
end

local status, lspconfig = pcall(require, "lspconfig")

if (not status) then
  return
end

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local icons = require('brunoarueira.icons')

lspkind.init({
  symbol_map = {
    Text = '',
    Method = '',
    Function = '󰊕',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
    Unknown = ''
  }
})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBoarder:Pmenu,Search:None',
      col_offset = -3,
      side_padding = 0,
    },

    documentation = cmp.config.window.bordered(),
  },

  mapping = {
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jumpable()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)

      local strings = vim.split(kind.kind, '%s', { trimempty = true })

      kind.kind = " " .. (strings[1] or "") .. " "

      return kind
    end
  },

  sources = {
    { name = 'nvim_lsp', keyword_length = 2 },
    { name = 'luasnip',  keyword_length = 2 },
    { name = 'path' }
  }
})

local border_opts = {
  border = { { "╭" }, { "─" }, { "╮" }, { "│" }, { "╯" }, { "─" }, { "╰" }, { "│" } },
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CmpSel,Search:None,NormalFloat:Normal",
  scrollbar = false,
}

vim.diagnostic.config({
  float = border_opts,
})

vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

vim.cmd [[
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

lsp_zero.preset('recommended')

lsp_zero.set_sign_icons(icons)

local lsp_defaults = lspconfig.util.default_config

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument = {
  foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  },
}

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  capabilities
)

lsp_zero.set_server_config({
  capabilities = capabilities,
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end
    })
  end
end)

local servers = {
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'solargraph',
  'tsserver',
  'vale_ls',
  'yamlls',
}

lsp_zero.ensure_installed(servers)
lsp_zero.setup_servers(servers)

lspconfig.vale_ls.setup({
  filetypes = { 'markdown', 'mdx' }
})

lspconfig.solargraph.setup({
  cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
  flags = {
    debounte_text_changes = 50,
  },
  settings = {
    solargraph = {
      autoformat = false,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
})

lspconfig.lua_ls.setup({
  single_file_support = true,
  flags = {
    debounce_text_changes = 150,
  },
})
