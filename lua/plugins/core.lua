return {
  {
    "jcdickinson/wpm.nvim",
    config = function()
        require("wpm").setup({})
    end
  },
  -- auto-session
  "rmagatti/auto-session",
  {
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffer",
                -- 显示id
                number = "ordinal"
            }
        })
    end
  },
}