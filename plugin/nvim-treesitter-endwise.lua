if vim.g.loaded_treesitter_endwise then
    return
end

vim.g.loaded_treesitter_endwise = true

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterEndwise", {}),
    pattern = vim.g.treesitter_endwise_filetypes or nil,
    callback = function(args)
        if vim.fn.index(vim.g.treesitter_endwise_filetypes_disable or {}, vim.bo[0].filetype) ~= -1 then
            return
        end
        require("treesitter-endwise").detach(args.buf)
        require("treesitter-endwise").attach(args.buf)
    end,
    desc = "Reattach module",
})
