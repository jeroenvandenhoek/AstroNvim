-- local powershell_options = {
--   shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
--   shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--   shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--   shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--   shellquote = "",
--   shellxquote = "",
-- }
--
-- for option, value in pairs(powershell_options) do
--   vim.opt[option] = value
-- end


for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      "Error setting up colorscheme: " .. astronvim.default_colorscheme,
      vim.log.levels.ERROR
    )
  end
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

vim.o.background = "dark"
vim.cmd [[colorscheme gruvbox]]

vim.cmd([[au BufReadPost *.hbs set syntax=html]])

vim.cmd [["set shell=/bin/zsh"]]
