<h1 align="center">
  <a href="https://github.com/RRethy/nvim-treesitter-endwise">nvim-treesitter-endwise</a>
</h1>

<h4 align="center">wisely add "end" in Ruby, Lua, Vimscript, etc.</h4>

https://user-images.githubusercontent.com/21000943/150613732-442589e2-6b08-4b14-b0a3-47effef0eb28.mov

# Introduction

This is a simple plugin that helps to end certain structures automatically. In Ruby, this means adding end after if, do, def, etc.

<!-- This even works for languages nested inside other, such as Markdown with a Lua code block! -->

**Supported Languages**: *Ruby*, *Lua*, *Vimscript*, *Bash*, *Elixir*, *Fish*, *Julia*

# Quick Start

You can install this plugin using your favorite plugin manager or `packages` feature in Neovim.

> [!NOTE]
> This plugin does **not** support lazy loading.

After installing the plugin, make sure that you install the Treesitter parsers for the languages. For example, if you use [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):
```vim
:TSInstall ruby lua vim bash elixir fish julia
```
Also make sure that you have enabled Treesitter highlighting for the filetypes you want to use this plugin with.

```lua
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'ruby', 'lua', 'vim', 'bash', 'elixir', 'fish', 'julia'},
    callback = function()
        vim.treesitter.start()
    end
})
```

If you want to enable this plugin for some filetypes only, you can use the following code:
```lua
vim.g.treesitter_endwise_filetypes = {'ruby', 'lua', 'vim', 'bash', 'elixir', 'fish', 'julia'}
```

Or to disable it for some filetypes:
```lua
vim.g.treesitter_endwise_filetypes_disable = {'fish'}
```

# Additional Language Support

Please open an issue for new languages, right now I'm open PRs but I won't be implementing other languages myself (except for maybe shell script). See https://github.com/RRethy/nvim-treesitter-endwise/issues/2#issuecomment-1019574925 for more information on adding support for a new language.

# Credit

This is just a rewrite of https://github.com/tpope/vim-endwise to leverage Treesitter so it can be more accurate and work without having to run Neovim's slow regex based highlighting along with nvim-treesitter highlighting.

Special thanks to
* [@jasonrhansen](https://www.github.com/jasonrhansen) who added support for injected languages and Vimscript.
* [@simonmandlik](https://www.github.com/simonmandlik) who added support for Julia.
