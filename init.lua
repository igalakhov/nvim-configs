require("config.options")
require("config.lazy")

-- Load work config if it exists
local work_config = vim.fn.stdpath("config") .. "/lua/config/work.lua"
if vim.fn.filereadable(work_config) == 1 then
  require("config.work")
end
