-- norgw-sync.lua
local M = {}

-- Specify the local path for the Git repository
local git_repo_path = "~/Desktop/ORG"

local function get_commit_message()
    local user_name = vim.fn.system("git config user.name")
    local pc_name = vim.fn.system("hostname")
    return string.format("dev@%s_%s", user_name, pc_name)
end

M.sync_workspace = function()
    -- Change into the Git repository directory
    vim.cmd("cd " .. git_repo_path)

    -- Example: print a message
    print("Syncing Neorg workspace in directory: " .. git_repo_path)

    -- Example: Check if there are changes in the working directory
    local status = vim.fn.system({'git', 'status', '--porcelain'})
    if status ~= "" then
        -- There are changes in the working directory
        print("Changes detected. Committing and pushing...")
        vim.fn.system({'git', 'add', '.'})
        local commit_message = get_commit_message()
        vim.fn.system({'git', 'commit', '-m', commit_message})
        vim.fn.system({'git', 'push'})
        print('Sync Success. 😀')
    else
        -- Nothing to sync
        print("Workspace is up to date.")
    end
end

return M
