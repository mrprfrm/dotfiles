local auto_pairs_status_ok, auto_pairs = pcall(require, "nvim-autopairs")
if not auto_pairs_status_ok then
  return
end

auto_pairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    java_script = { "string", "template_string" },
  },
  fast_wrap = {
    map = "<C-q>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = "$",
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment'
  }
}

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
