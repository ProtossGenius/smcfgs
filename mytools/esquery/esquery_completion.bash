_esquery_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # First argument: environment
    if [ $COMP_CWORD -eq 1 ]; then
        local env_dir="$HOME/.config/esenv"
        if [ -d "$env_dir" ]; then
            local envs=$(ls "$env_dir"/*.env 2>/dev/null | xargs -n1 basename | sed 's/\.env$//')
            COMPREPLY=( $(compgen -W "$envs" -- "$cur") )
        fi
        return 0
    fi

    # Second argument: index / path
    if [ $COMP_CWORD -eq 2 ]; then
        local env_name="${COMP_WORDS[1]}"
        local env_file="$HOME/.config/esenv/${env_name}.env"
        
        if [ -f "$env_file" ]; then
            source "$env_file"
            local auth=""
            if [ ! -z "$ES_USER" ] && [ ! -z "$ES_PASS" ]; then
                auth="-u $ES_USER:$ES_PASS"
            fi
            
            if [[ "$cur" == */* ]]; then
                # After the first slash, we suggest commands from commands.conf
                local base_path="${cur%%/*}"
                local sub_path="${cur#*/}"
                
                # Find the commands.conf. It should be in the same dir as the script or in the install dir.
                local cmd_conf
                if [ -f "$(dirname $(which esquery))/commands.conf" ]; then
                    cmd_conf="$(dirname $(which esquery))/commands.conf"
                elif [ -f "$HOME/.local/share/esquery/commands.conf" ]; then
                    cmd_conf="$HOME/.local/share/esquery/commands.conf"
                else
                    cmd_conf="./commands.conf"
                fi
                
                local commands=$(awk '{print $1}' "$cmd_conf" 2>/dev/null)
                local cmd_list=""
                for cmd in $commands; do
                    cmd_list+="${base_path}/${cmd} "
                done
                COMPREPLY=( $(compgen -W "$cmd_list" -- "$cur") )
            else
                # Fetch indices and use fzf
                local indices
                # Simple cache to avoid multiple curls in the same completion attempt
                local cache_file="/tmp/esquery_indices_${env_name}"
                if [ ! -f "$cache_file" ] || [ -z "$(find "$cache_file" -mmin -1)" ]; then
                    indices=$(curl -s $auth "${ES_HOST}/_cat/indices?h=index" | sort)
                    echo "$indices" > "$cache_file"
                else
                    indices=$(cat "$cache_file")
                fi

                if command -v fzf >/dev/null 2>&1; then
                    # We need to handle the case where fzf is used in completion.
                    # This trick allows fzf to work in bash completion.
                    local selected
                    selected=$(echo "$indices" | fzf -q "$cur" --height=10 --reverse --header="Select Index" < /dev/tty)
                    if [ -n "$selected" ]; then
                        COMPREPLY=( "$selected/" )
                    fi
                else
                    COMPREPLY=( $(compgen -W "$indices" -- "$cur") )
                fi
            fi
        fi
        return 0
    fi
}

complete -o nospace -F _esquery_completion esquery
