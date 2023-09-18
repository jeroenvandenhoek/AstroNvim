return {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        local treesj = require('treesj')
        local lu = require('treesj.langs.utils')
        local langs = {
            Javascript = require('treesj.langs.javascript'),
            Typescript = require('treesj.langs.typescript'),
            Tsx = require('treesj.langs.tsx'),
            Svelte = require('treesj.langs.svelte'),
            Json = require('treesj.langs.json'),
            Jsonc = require('treesj.langs.jsonc'),
            Html = require('treesj.langs.html'),
            Css = require('treesj.langs.css'),
            Scss = require('treesj.langs.scss'),
            Lua = require('treesj.langs.lua'),
            Python = require('treesj.langs.python'),
            Vue = require('treesj.langs.vue'),
            Bash = require('treesj.langs.bash'),
            Go = require('treesj.langs.go'),
            SQL = require('treesj.langs.sql'),
            Yaml = require('treesj.langs.yaml'),
        }
        treesj.setup(
            {
                ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
                use_default_keymaps = true,
                ---@type boolean Node with syntax error will not be formatted
                check_syntax_error = true,
                ---If line after join will be longer than max value,
                ---@type number If line after join will be longer than max value, node will not be formatted
                max_join_length = 120,
                ---Cursor behavior:
                ---hold - cursor follows the node/place on which it was called
                ---start - cursor jumps to the first symbol of the node being formatted
                ---end - cursor jumps to the last symbol of the node being formatted
                ---@type 'hold'|'start'|'end'
                cursor_behavior = 'hold',
                ---@type boolean Notify about possible problems or not
                notify = true,
                ---@type table Presets for languages
                langs = lu._prepare_presets(langs),
                ---@type boolean Use `dot` for repeat action
                dot_repeat = true,
                ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
                on_error = nil,
            }
        )
    end,
}
