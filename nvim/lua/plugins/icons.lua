-- local iconpack

local M = {}

--- Diagnostic severities.
M.diagnostics = {
    ERROR = '',
    WARN = '',
    HINT = '',
    INFO = '',
}

--- For folding.
M.arrows = {
    right = '',
    left = '',
    up = '',
    down = '',
}

--- Shared icons that don't really fit into a category.
M.misc = {
    bug = '',
    dashed_bar = '┊',
    ellipsis = '…',
    git = '',
    palette = '󰏘',
    robot = '󰚩',
    search = '',
    terminal = '',
    toolbox = '󰦬',
    vertical_bar = '│',
}

return M
