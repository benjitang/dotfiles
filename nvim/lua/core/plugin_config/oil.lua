require("oil").setup()
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>cd", function()
  local dir = require("oil").get_current_dir()
  if dir then
    vim.cmd.cd(dir)
    print("cwd set to: " .. dir)
  end
end, { desc = "Set cwd to oil's current directory" })