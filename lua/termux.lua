local M = {}

-- Function to fix shebangs in all files in Mason bin directory on Termux (Android)
function M.MasonFixShebang()
  if vim.fn.has("unix") == 0 or vim.fn.has("android") == 0 then
    vim.notify("This function is only for Termux on Android.", vim.log.levels.WARN)
    return
  end

  local termux_prefix = os.getenv("TERMUX_PREFIX") or "/data/data/com.termux/files/usr" -- Default TERMUX_PREFIX
  local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin")
  local files = vim.fn.globpath(mason_bin, "*", false, true)

  if #files == 0 then
    vim.notify("No files found in " .. mason_bin, vim.log.levels.WARN)
    return
  end

  for _, file in ipairs(files) do
    local filepath = vim.fn.fnamemodify(file, ":p") -- Get absolute path
    local f = io.open(filepath, "r")
    if f then
      local first_line = f:read("*l")
      local rest = f:read("*a")
      f:close()

      if first_line and first_line:match("^#!.*/[sx]?bin/.*") then
        local new_shebang = first_line:gsub("^#!(.*)/[sx]?bin/(.*)", "#!" .. termux_prefix .. "/bin/%2")
        f = io.open(filepath, "w")
        if f then
          f:write(new_shebang .. "\n" .. rest)
          f:close()
          vim.notify("Shebang fixed in " .. filepath, vim.log.levels.INFO)
        else
          vim.notify("Failed to write to file: " .. filepath, vim.log.levels.ERROR)
        end
      end
    else
      vim.notify("Failed to open file: " .. filepath, vim.log.levels.ERROR)
    end
  end
end

-- Function to return a list of LSP servers when running on Android
function M.PreLspServers(servers_list)
  if vim.fn.has("android") == 1 then
    return {
      "jqls",
      "texlab",
      "helm_ls",
      "lua_ls",
      "luau_lsp",
      "clangd",
      "rust_analyzer",
      "intelephense"
    }
  else
    return servers_list or {}
  end
end

return M

