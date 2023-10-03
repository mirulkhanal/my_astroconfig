local M = {}

-- Specify the local path for the Git repository
local git_repo_path = "~/Desktop/ORG"

local function get_commit_message()
    local user_name = vim.fn.system("git config user.name")
    local pc_name = vim.fn.system("hostname")
    return string.format("dev@%s_%s", user_name, pc_name)
end

function M.sync_workspace()
    -- Change into the Git repository directory
    vim.cmd("cd " .. git_repo_path)

    -- Example: print a message
    print("Syncing Neorg workspace in directory: " .. git_repo_path)

    -- Run Git fetch to update remote branches
    vim.fn.system("git fetch")

    -- Check if the local branch is behind the remote branch
    local is_behind = vim.fn.system("git status -uno | grep 'Your branch is behind'") ~= ""

    if is_behind then
        -- Local is behind, try pulling changes
        print("Local branch is behind. Attempting to pull changes...")

        local pull_status = vim.fn.system("git pull")

        if pull_status == 0 then
            print('Pull Success. 😀')
        else
            -- Pull was not successful (probably due to local changes). Add, commit, and pull again
            print("Pull failed. Adding and committing local changes...")

            vim.fn.system({'git', 'add', '.'})
            local commit_message = get_commit_message()
            vim.fn.system({'git', 'commit', '-m', commit_message})

            local second_pull_status = vim.fn.system("git pull")

            if second_pull_status == 0 then
                print('Second Pull Success. 😀')
            else
                print('Second Pull failed. Please resolve conflicts manually.')
            end
        end
    else
        -- Nothing to pull, add, commit, and push changes
        print("Local repository is up to date. Adding, committing, and pushing changes...")

        -- Example: Check if there are changes in the working directory
        local status = vim.fn.system({'git', 'status', '--porcelain'})
        if status ~= "" then
            -- There are changes in the working directory
            print("Changes detected. Committing and pushing...")
            vim.fn.system({'git', 'add', '.'})
            local commit_message = get_commit_message()
            vim.fn.system({'git', 'commit', '-m', commit_message})
            vim.fn.system({'git', 'push'})
            print('Push Success. 😀')
        else
            -- Nothing to sync
            print("No local changes to sync.")
        end
    end
end

return M
