local keymap = vim.keymap

--windows 分屏快捷键
keymap.set("n", "sv", ":vsp<CR>")
keymap.set("n", "sh", ":sp<CR>")
-- 关闭当前
keymap.set("n", "zc", "<C-w>c")
-- 关闭其他
keymap.set("n", "zo", "<C-w>o")
