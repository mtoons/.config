vim.api.nvim_set_hl(0, "StatuslineNormalBg", { fg = "#1e1e2e", bg = "#89b4fa", bold = true })
vim.api.nvim_set_hl(0, "StatuslineNormalFg", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "StatuslineInsertBg", { fg = "#1e1e2e", bg = "#a6e3a1", bold = true })
vim.api.nvim_set_hl(0, "StatuslineInsertFg", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "StatuslineVisualBg", { fg = "#1e1e2e", bg = "#cba6f7", bold = true })
vim.api.nvim_set_hl(0, "StatuslineVisualFg", { fg = "#cba6f7" })
vim.api.nvim_set_hl(0, "StatuslineCommandBg", { fg = "#1e1e2e", bg = "#fab387", bold = true })
vim.api.nvim_set_hl(0, "StatuslineCommandFg", { fg = "#fab387" })
vim.api.nvim_set_hl(0, "StatuslineReplaceBg", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
vim.api.nvim_set_hl(0, "StatuslineReplaceFg", { fg = "#f38ba8" })
vim.api.nvim_set_hl(0, "StatuslineOtherBg", { fg = "#1e1e2e", bg = "#94e2d5", bold = true })
vim.api.nvim_set_hl(0, "StatuslineOtherFg", { fg = "#94e2d5" })
local function statusline()
    local modes = {
        ["n"] = "%#StatuslineNormalBg# ormal %#StatuslineNormalFg#",
        ["no"] = "%#StatuslineNormalBg# ormal %#StatuslineNormalFg#",
        ["v"] = "%#StatuslineVisualBg# isual %#StatuslineVisualFg#",
        ["V"] = "%#StatuslineVisualBg# -line %#StatuslineVisualFg#",
        [""] = "%#StatuslineVisualBg# -block %#StatuslineVisualFg#",
        ["s"] = "%#StatuslineOtherBg# Select %#StatuslineOtherFg#",
        ["S"] = "%#StatuslineOtherBg# S-line %#StatuslineOtherFg#",
        [""] = "%#StatuslineOtherBg# S-block %#StatuslineOtherFg#",
        ["i"] = "%#StatuslineInsertBg# 󰗧nsert %#StatuslineInsertFg#",
        ["ic"] = "%#StatuslineInsertBg# 󰗧nsert %#StatuslineInsertFg#",
        ["R"] = "%#StatuslineReplaceBg# Replace %#StatuslineReplaceFg#",
        ["Rv"] = "%#StatuslineOtherBg# -replace %#StatuslineOtherFg#",
        ["c"] = "%#StatuslineCommandBg#  ommand %#StatuslineCommandFg#",
        ["cv"] = "%#StatuslineOtherBg#  Ex %#StatuslineOtherFg#",
        ["ce"] = "%#StatuslineOtherBg# Ex %#StatuslineOtherFg#",
        ["r"] = "%#StatuslineOtherBg# Prompt %#StatuslineOtherFg#",
        ["rm"] = "%#StatuslineOtherBg# Moar %#StatuslineOtherFg#",
        ["r?"] = "%#StatuslineOtherBg# Confirm %#StatuslineOtherFg#",
        ["!"] = "%#StatuslineOtherBg# hell %#StatuslineOtherFg#",
        ["t"] = "%#StatuslineOtherBg# Terminal %#StatuslineOtherFg#",
    }
    local mode = "%#StatuslineOtherBg# Terminal %#StatuslineOtherFg#"
    if modes[vim.api.nvim_get_mode().mode] then mode = modes[vim.api.nvim_get_mode().mode] end

    local icon, hl, _ = require "mini.icons".get("filetype", vim.bo.ft)
    local ft = "%#" .. hl .. "#" .. icon .. "%## " .. vim.bo.ft

    local diagnostics = ""
    local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    local hint_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    if err_count > 0 then
        diagnostics = "%#DiagnosticSignError#" .. diagnostics ..
            vim.diagnostic.config().signs.text[vim.diagnostic.severity.ERROR] .. tostring(err_count)
    end
    if warn_count > 0 then
        diagnostics = "%#DiagnosticSignWarn#" .. diagnostics ..
            vim.diagnostic.config().signs.text[vim.diagnostic.severity.WARN] .. tostring(warn_count)
    end
    if info_count > 0 then
        diagnostics = "%#DiagnosticSignInfo#" .. diagnostics ..
            vim.diagnostic.config().signs.text[vim.diagnostic.severity.INFO] .. tostring(info_count)
    end
    if hint_count > 0 then
        diagnostics = "%#DiagnosticSignHint#" .. diagnostics ..
            vim.diagnostic.config().signs.text[vim.diagnostic.severity.HINT] .. tostring(hint_count)
    end
    diagnostics = diagnostics .. "%## "

    vim.o.stl = mode .. "%## %t " .. diagnostics .. "%m%=" .. ft
end

statusline()
---@diagnostic disable-next-line
vim.api.nvim_create_autocmd({ "ModeChanged", "FileType", "WinEnter", "DiagnosticChanged" }, {
    desc = "Update statusline",
    callback = statusline,
})
