function fish_prompt --description 'Informative prompt'
    # Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    if not test -n "$pipestatus_string"
        set pipestatus_string ' '
    end

    set -l fish_str '><(((*>'

    set -l branch_color (set_color -u FFFF00)
    set -l branch (git branch --show-current 2>/dev/null)

    if test -n "$branch"

        # git
        printf '[%s%s%s] %s%s@%s %s%s %s%s%s %s%s \n%s ' \
            (set_color 00FFAF) (date "+%H:%M:%S") (set_color normal) \
            (set_color D787AF) $USER (prompt_hostname) \
            (set_color 5FAFFF) $PWD \
            $branch_color $branch (set_color normal) \
            $pipestatus_string (set_color normal) \
            $fish_str

    else

        # no git
        printf '[%s%s%s] %s%s@%s %s%s %s%s%s \n%s ' \
            (set_color 00FFAF) (date "+%H:%M:%S") (set_color normal) \
            (set_color D787AF) $USER (prompt_hostname) \
            (set_color 5FAFFF) $PWD \
            $pipestatus_string \
            (set_color normal) \
            $fish_str

    end

end
