vim.opt.runtimepath:append('.')
vim.cmd.runtime('plugin/nvim-treesitter-endwise.lua')
vim.opt.runtimepath:append('../nvim-treesitter')
vim.cmd.runtime('plugin/nvim-treesitter.lua')
vim.opt.showmode = false

local function feedkeys(input)
    local keys = vim.api.nvim_replace_termcodes(input, true, false, true)
    vim.fn.feedkeys(keys, 'n')
end

function ExecuteCR(n)
    vim.schedule(function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'PostNvimTreesitterEndwiseCR',
            command = 'silent wq'
        })
        feedkeys(string.rep('l', n) .. 'a<CR>')
    end)
end

function ExecuteCRTwiceAndUndo(n)
    local call_count = 0
    local post_endwise_cb = function()
        call_count = call_count + 1

        if call_count < 2 then
            feedkeys('<CR>')
        else
            vim.cmd([[ silent undo | silent wq ]])
        end
    end

    vim.schedule(function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'PostNvimTreesitterEndwiseCR',
            callback = post_endwise_cb
        })
        feedkeys(string.rep('l', n) .. 'a<CR>')
    end)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        local ok, _, _ = pcall(vim.treesitter.start)
        if not ok then
            local lang = vim.treesitter.language.get_lang(vim.bo.ft)
            vim.cmd.TSInstallSync(lang)
            vim.treesitter.start()
        end
    end
})
