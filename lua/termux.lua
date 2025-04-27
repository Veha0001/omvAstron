local M = {}

-- Use vim.uv safely (fallback if not available)
local uv = vim.uv or vim.loop
local termux_prefix = os.getenv("PREFIX") or "/data/data/com.termux/files/usr"

-- Safely check if Termux prefix path exists
local is_termux = false
if uv and type(uv.fs_stat) == "function" then
  local stat = uv.fs_stat(termux_prefix)
  if stat and stat.type == "directory" then
    is_termux = true
  end
end

--- Return true if running in Termux on Android
function M.IsTermux()
  return is_termux and vim.fn.has("unix") == 1 and vim.fn.has("android") == 1
end

function M.MasonFixShebang()
  if not M.IsTermux() then
    vim.notify("This function is only for Termux on Android.", vim.log.levels.WARN)
    return
  end

  local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin")
  local files = vim.fn.globpath(mason_bin, "*", false, true)

  if #files == 0 then
    vim.notify("No files found in " .. mason_bin, vim.log.levels.WARN)
    return
  end

  local fixed = {}

  for _, file in ipairs(files) do
    local filepath = vim.fn.fnamemodify(file, ":p")
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
          table.insert(fixed, vim.fn.fnamemodify(filepath, ":t"))
        end
      end
    end
  end

  if #fixed > 0 then
    vim.schedule(function()
      vim.notify(
        "Fixed shebang in " .. #fixed .. " file(s):\n  - " .. table.concat(fixed, "\n  - "),
        vim.log.levels.INFO,
        { title = "MasonFixShebang", timeout = 5000 }
      )
    end)
  else
    vim.notify("No shebangs needed fixing.", vim.log.levels.INFO, { title = "MasonFixShebang" })
  end
end

function M.PreLspServersList(servers_list)
  if M.IsTermux() then
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

