require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

--jump out of quotes and brackets with tab
-- vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : (getline(\'.\')[col(\'.\') - 2] =~ \'\\v["\\[\\(\\{]\') ? "\\<Right>\\<C-o>A" : "\\<Tab>"', { expr = true, noremap = true })
--
-- Map Tab to move to end of line in Insert mode and continue in Insert mode
-- vim.api.nvim_set_keymap('i', '<Tab>', '<C-o>A', { noremap = true })

