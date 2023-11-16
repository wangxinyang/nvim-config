return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        commit = "addd6e174a85fc1c4007ab0b65d77e6555b417bf",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                    change = {
                        hl = "GitSignsChange",
                        text = "│",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = "_",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = "‾",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = "~",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,  -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "single",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                yadm = {
                    enable = false,
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end
                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Actions
                    map('n', '<leader>ss', gs.stage_hunk, { desc = "gs.stage_hunk" })
                    map('n', '<leader>sr', gs.reset_hunk, { desc = "gs.reset_hunk" })
                    map('v', '<leader>ss', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = "gs.stage_hunk" })
                    map('v', '<leader>sr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = "gs.reset_hunk" })
                    map('n', '<leader>sS', gs.stage_buffer, { desc = "gs.stage_buffer" })
                    map('n', '<leader>su', gs.undo_stage_hunk, { desc = "gs.undo_stage_hunk" })
                    map('n', '<leader>sR', gs.reset_buffer, { desc = "gs.reset_buffer" })
                    map('n', '<leader>sp', gs.preview_hunk, { desc = "gs.preview_hunk" })
                    map('n', '<leader>sb', function() gs.blame_line { full = true } end, { desc = "gs.blame_line" })
                    map('n', '<leader>stb', gs.toggle_current_line_blame, { desc = "gs.toggle_current_line_blame" })
                    map('n', '<leader>sd', gs.diffthis, { desc = "gs.diffthis" })
                    map('n', '<leader>sD', function() gs.diffthis('~') end, { desc = "gs.diffthis" })
                    map('n', '<leader>std', gs.toggle_deleted, { desc = "gs.toggle_deleted" })
                end
            })
        end,
    },
    { "tpope/vim-rhubarb", event = "VeryLazy" },
    {
        event = "VeryLazy",
        "tpope/vim-fugitive",
        config = function() end,
        -- cmd = "Git",
    },
    -- {
    -- 	"shumphrey/fugitive-gitlab.vim",
    -- 	event = "VeryLazy",
    -- 	config = function()
    -- 		-- check operation system
    -- 		local is_mac = vim.fn.has("mac") == 1
    -- 		if is_mac then
    -- 			local secret = require("secret")
    -- 			vim.g.fugitive_gitlab_domains = { secret.GITALB_URL }
    -- 		end
    -- 	end,
    -- },
    -- git related
    {
        "rhysd/conflict-marker.vim",
        event = "VeryLazy",
        config = function()
            vim.cmd([[
      let g:conflict_marker_highlight_group = ''
      " Include text after begin and end markers
      let g:conflict_marker_begin = '^<<<<<<< .*$'
      let g:conflict_marker_end   = '^>>>>>>> .*$'

      highlight ConflictMarkerBegin guibg=#2f7366
      highlight ConflictMarkerOurs guibg=#2e5049
      highlight ConflictMarkerTheirs guibg=#344f69
      highlight ConflictMarkerEnd guibg=#2f628e
      highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
		]])
        end,
    },
}
