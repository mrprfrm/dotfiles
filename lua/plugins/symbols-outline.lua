local outline_status_ok, outline = pcall(require, 'symbols-outline')
if not outline_status_ok then
  return
end

-- Possible icons
--     𝓒 ƒ    ℰ ﰮ    𝓐 # ⊨  ⦿ 🔐 NULL  𝓢 🗲 + 𝙏
--  ﯟ N P  m       ﰊ ﰉ S N B A O K  NUll     
--  ﯟ    m       ﰉ         ﰊ        
vim.g.symbols_outline = {
  highlight_hovered_item = false,
  auto_preview = false,
  symbols = {
    File = {icon = "", hl = "TSURI"},
    Module = {icon = "ﯟ", hl = "TSNamespace"},
    Namespace = {icon = "", hl = "TSNamespace"},
    Package = {icon = "", hl = "TSNamespace"},
    Class = {icon = "", hl = "TSType"},
    Method = {icon = "m", hl = "TSMethod"},
    Property = {icon = "", hl = "TSMethod"},
    Field = {icon = "", hl = "TSField"},
    Constructor = {icon = "", hl = "TSConstructor"},
    Enum = {icon = "", hl = "TSType"},
    Interface = {icon = "", hl = "TSType"},
    Function = {icon = "", hl = "TSFunction"},
    Variable = {icon = "ﰉ", hl = "TSConstant"},
    Constant = {icon = "", hl = "TSConstant"},
    String = {icon = "", hl = "TSString"},
    Number = {icon = "", hl = "TSNumber"},
    Boolean = {icon = "", hl = "TSBoolean"},
    Array = {icon = "", hl = "TSConstant"},
    Object = {icon = "", hl = "TSType"},
    Key = {icon = "", hl = "TSType"},
    Null = {icon = "ﰊ", hl = "TSType"},
    EnumMember = {icon = "", hl = "TSField"},
    Struct = {icon = "", hl = "TSType"},
    Event = {icon = "", hl = "TSType"},
    Operator = {icon = "", hl = "TSOperator"},
    TypeParameter = {icon = "", hl = "TSParameter"}
  }
}
