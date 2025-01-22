if vim.g.loaded_treesitter_endwise then
    return
end

vim.g.loaded_treesitter_endwise = true

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterEndwise", {}),
    callback = function(args)
        require("treesitter-endwise").detach(args.buf)
        require("treesitter-endwise").attach(args.buf)
    end,
    desc = "Reattach module",
})
