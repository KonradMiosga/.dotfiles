require 'config.settings'

local undodir_opt = vim.opt.undodir:get()
local undodir_path = ''

if type(undodir_opt) == 'table' and #undodir_opt > 0 then
  undodir_path = vim.fn.expand(undodir_opt[1])
elseif type(undodir_opt) == 'string' and undodir_opt ~= '' then
  undodir_path = vim.fn.expand(undodir_opt)
end

if undodir_path ~= '' and vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, 'p')
end

require 'config.keymaps'
require 'config.packs'
