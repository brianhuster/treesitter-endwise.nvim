vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterEndwise", {}),
    callback = function(args)
        pcall(vim.treesitter.start)
        require("treesitter-endwise").detach(args.buf)
        require("treesitter-endwise").attach(args.buf)
    end,
    desc = "Reattach module",
})
