require("bufferline").setup {
    options = {
        numbers = "none",
        show_close_icon = false,
        show_buffer_close_icons = false,
        modified_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if level:match("error") then
                return ""
            elseif level:match("warn") then
                return ""
            end
        end,
        diagnostics_update_in_insert = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_tab_indicators = true,
        always_show_bufferline = true,
        separator_style = "slant"
    }
}
