local M = {}
M.getHighlightGroupAsTable = function(name)
    local hiTable = {}
    hiTable.name = name

    local hlID  = vim.fn.hlID(name)
    local synId = vim.fn.synIDtrans(hlID)
    local function getAttr(attrName, mode) -- mode=gui|cterm
        return vim.fn.synIDattr(synId, attrName, mode)
    end
    hiTable.gui     = ""
    if getAttr("bold", "gui") == "1" then
        hiTable.gui = "bold"
    elseif getAttr("italic", "gui") == "1" then
        hiTable.gui = "italic"
    elseif getAttr("underline", "gui") == "1" then
        hiTable.gui = "underline"
    end
    hiTable.cterm     = ""
    if getAttr("bold", "cterm") == "1" then
        hiTable.cterm = "bold"
    elseif getAttr("italic", "cterm") == "1" then
        hiTable.cterm = "italic"
    elseif getAttr("underline", "cterm") == "1" then
        hiTable.cterm = "underline"
    end
    -- TODO: add multiple options like "underline,bold"

    -- if getAttr("italic", "gui")  == "1" then
    --     hiTable.gui = "bold"
    -- end
    hiTable.guifg   = getAttr("fg", "gui")
    hiTable.guibg   = getAttr("bg", "gui")
    -- hiTable.cterm   = getAttr("bold", "cterm")
    hiTable.ctermbg = getAttr("bg", "cterm")
    hiTable.ctermfg = getAttr("fg", "cterm")
    --hiTable.guibg = vim.cmd 'synIDattr(synIDtrans(hlID(name)), "guibg")'
    return hiTable
end

M.createHighlightGroup = function(name, highlightTable, baseHlGroup) -- TODO: accept baseHlGroup as string (name of the group)
    local opts   = {}
    opts.gui     = "" -- bold, italic
    opts.guifg   = "" -- foreground
    opts.guibg   = "" -- background
    opts.ctermfg = "" -- same
    opts.ctermbg = ""
    opts.cterm   = ""
    for key, _ in pairs(opts) do
        if highlightTable[key] then
            opts[key] = key .. "=" .. highlightTable[key]
        elseif baseHlGroup and baseHlGroup[key] ~= "" then
            opts[key] = key .. "=" .. baseHlGroup[key]
        end
    end
    local cmd = "highlight " .. name .. " "
    for _, value in pairs(opts) do
        cmd = cmd .. value .. " "
    end
    -- print(cmd)
    vim.cmd(cmd)
    -- if(highlightTable.guifg) then
    --     guifg = "guifg=" .. highlightTable.guifg
    -- end
    -- vim.cmd("highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end
M.createHighlightGroup("Teste", {gui = "bold", guifg="#ffffff", guibg="#000000"})
-- local commentHl = M.getHighlightGroupAsTable("WarningMsg")
-- for key, value in pairs(commentHl) do
--     print(key .. "="..value)
-- end

return M
