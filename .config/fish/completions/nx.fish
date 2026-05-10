function __parseProjectGraph
    set -l projectGraphFilePath $argv[1]
    jq -r '.nodes | to_entries | map("\(.key as $project | .value.data.targets | keys | map("\($project):\(.)") | .[])") | .[]' $projectGraphFilePath
end

function __nx_run
    if not type -q jq
        return
    end

    if test -e nx.json
        # support for both nx types >=17 and <17
        set -l cacheDirectory (jq -r '.tasksRunnerOptions.default.options.cacheDirectory // .cacheDirectory // ".nx/cache"' nx.json)
        set -l nxWorkspaceDataDirectory '.nx/workspace-data'

        set -l graph_files \
            "$cacheDirectory/project-graph.json" \
            "$cacheDirectory/nxdeps.json" \
            "$nxWorkspaceDataDirectory/project-graph.json"

        # Iterate over the list and parse the first existing file
        for file in $graph_files
            if test -e $file
                __parseProjectGraph $file
                return
            end
        end

        if not type -q fd
            return
        end

        # Parallel processing of project.json files using fd for faster file discovery
        fd --exclude node_modules --type f 'project.json' | xargs cat | jq -sr '[.[] | {name: .name} as $savedName | [.targets | to_entries[] | $savedName.name + ":" + .key]] | add | .[]'

    else if test -e workspace.json
        jq -r '.projects | to_entries | map("\(.key as $project | .value.targets | keys | map("\($project):\(.)") | .[])") | .[]' workspace.json
    end

end

set -l nx_commands add affected connect create-nx-workspace daemon exec format:check format:write generate graph init list migrate release repair report reset run run-many show view-logs watch

complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected -d 'Run target for affected projects'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a connect -d 'Connect workspace to Nx Cloud'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a create-nx-workspace -d 'Create a new Nx workspace'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a daemon -d 'Prints information about the Nx Daemon process or starts a daemon process'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a exec -d 'Executes any command as if it was a target on the project, or an arbitrary command in each package'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a format:check -d 'Check for un-formatted files'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a format:write -d 'Overwrite un-formatted files'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a generate -d 'Runs a generator that creates and/or modifies files based on a generator from a collection.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a graph -d 'Graph dependencies within workspace'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a init -d 'Adds Nx to any type of workspace. It installs nx, creates an nx.json configuration file and optionally sets up remote caching. For more info, check https://nx.dev/recipes/adopting-nx.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a list -d 'Lists installed plugins, capabilities of installed plugins and other available plugins.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a migrate -d 'Creates a migrations file or runs migrations from the migrations file.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a release -d 'Orchestrate versioning and publishing of applications and libraries'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a repair -d 'Repair any configuration that is no longer supported by Nx.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a report -d 'Reports useful version numbers to copy into the Nx issue template'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a reset -d 'Clears all the cached Nx artifacts and metadata about the workspace and shuts down the Nx Daemon.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a run -d 'Runs a target defined for your project. Target definitions can be found in the scripts property of the project package.json, or in the targets property of the project project.json file.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a run-many -d 'Run target for multiple listed projects'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a show -d 'Show information about the workspace (e.g., list of projects)'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a view-logs -d 'Enables you to view and interact with the logs via the advanced analytic UI from Nx Cloud to help you debug your issue. To do this, Nx needs to connect your workspace to Nx Cloud and upload the most recent run details. Only the metrics are uploaded, not the artefacts.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a watch -d 'Watch for changes within projects, and execute commands'

# run
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a run -d 'Run a target for a project'
complete -f -c nx -n "__fish_seen_subcommand_from run; and not __fish_seen_subcommand_from (__nx_run)" -a "(__nx_run)"
complete -f -c nx -n "__fish_seen_subcommand_from (__nx_run); and not __fish_seen_subcommand_from --" -a --

# --- Extensions inspired by https://github.com/jscutlery/nx-completion ---

function __nx_projects
    if not type -q jq
        return
    end

    if test -e nx.json
        set -l cacheDirectory (jq -r '.tasksRunnerOptions.default.options.cacheDirectory // .cacheDirectory // ".nx/cache"' nx.json)
        set -l nxWorkspaceDataDirectory '.nx/workspace-data'

        set -l graph_files \
            "$cacheDirectory/project-graph.json" \
            "$cacheDirectory/nxdeps.json" \
            "$nxWorkspaceDataDirectory/project-graph.json"

        for file in $graph_files
            if test -e $file
                jq -r '.nodes | keys[]' $file
                return
            end
        end
    else if test -e workspace.json
        jq -r '.projects | keys[]' workspace.json
    end
end

# Filter flags that accept project names (run-many, affected, graph, show)
set -l __nx_project_flag_cmds run-many affected graph show run

complete -c nx -n "__fish_seen_subcommand_from $__nx_project_flag_cmds" -l projects -x -a "(__nx_projects)" -d 'Comma-separated project list'
complete -c nx -n "__fish_seen_subcommand_from $__nx_project_flag_cmds" -l exclude -x -a "(__nx_projects)" -d 'Projects to exclude'
complete -c nx -n "__fish_seen_subcommand_from graph" -l focus -x -a "(__nx_projects)" -d 'Focus graph on a single project'

# run-many
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -s t -l target -x -d 'Target(s) to run'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l targets -x -d 'Target(s) to run'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l configuration -x -d 'Target configuration'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l parallel -x -d 'Max parallel processes'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l maxParallel -x -d 'Max parallel processes'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l all -d 'Run for all projects'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l skip-nx-cache -d 'Bypass Nx cache'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l output-style -x -a 'dynamic static stream stream-without-prefixes' -d 'Output style'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l nx-bail -d 'Stop on first failure'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l nx-ignore-cycles -d 'Ignore cycles in the task graph'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l verbose -d 'Verbose output'
complete -f -c nx -n "__fish_seen_subcommand_from run-many" -l runner -x -d 'Task runner'

# affected (run-many flags + SCM flags)
complete -f -c nx -n "__fish_seen_subcommand_from affected" -s t -l target -x -d 'Target(s) to run'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l configuration -x -d 'Target configuration'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l parallel -x -d 'Max parallel processes'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l all -d 'Run for all projects'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l skip-nx-cache -d 'Bypass Nx cache'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l output-style -x -a 'dynamic static stream stream-without-prefixes' -d 'Output style'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l nx-bail -d 'Stop on first failure'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l nx-ignore-cycles -d 'Ignore cycles in the task graph'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l verbose -d 'Verbose output'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l runner -x -d 'Task runner'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l base -x -d 'Base of the current branch (SHA/ref)'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l head -x -d 'Latest commit (SHA/ref)'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l files -x -d 'Files to use to calculate affected'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l uncommitted -d 'Uncommitted changes'
complete -f -c nx -n "__fish_seen_subcommand_from affected" -l untracked -d 'Untracked changes'

# run
complete -f -c nx -n "__fish_seen_subcommand_from run" -l configuration -x -d 'Target configuration'
complete -f -c nx -n "__fish_seen_subcommand_from run" -l verbose -d 'Verbose output'
complete -f -c nx -n "__fish_seen_subcommand_from run" -l skip-nx-cache -d 'Bypass Nx cache'

# generate
complete -f -c nx -n "__fish_seen_subcommand_from generate" -s d -l dry-run -d 'Preview changes without writing'
complete -f -c nx -n "__fish_seen_subcommand_from generate" -s f -l force -d 'Force overwrite of existing files'
complete -f -c nx -n "__fish_seen_subcommand_from generate" -l interactive -d 'Prompt for missing options'
complete -f -c nx -n "__fish_seen_subcommand_from generate" -l defaults -d 'Use default options'
complete -f -c nx -n "__fish_seen_subcommand_from generate" -l verbose -d 'Verbose output'

# migrate
complete -f -c nx -n "__fish_seen_subcommand_from migrate" -l run-migrations -x -d 'Migrations file to run'
complete -f -c nx -n "__fish_seen_subcommand_from migrate" -l from -x -d 'Use this version as starting point'
complete -f -c nx -n "__fish_seen_subcommand_from migrate" -l to -x -d 'Use this version as target'
