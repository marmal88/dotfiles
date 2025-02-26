vim.keymap.set({"n", "t"}, "<leader>tb", function()
    -- Check if there's already a terminal buffer with the 'term://' prefix
    local term_bufnrs = {}
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buftype == 'terminal' then
            table.insert(term_bufnrs, bufnr)
        end
    end

    -- Check if any terminal is visible in a window
    local term_win = nil
    for _, bufnr in ipairs(term_bufnrs) do
        for _, winid in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(winid) == bufnr then
                term_win = winid
                break
            end
        end
        if term_win then break end
    end

    -- Toggle terminal
    if term_win then
        -- Close the terminal window
        vim.api.nvim_win_close(term_win, true)
    else
        -- Open a new terminal window
        vim.cmd("botright horizontal term")
        vim.api.nvim_win_set_height(0, 10)
    end
end)
