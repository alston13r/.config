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

    printf '[%s%s%s] %s%s@%s %s%s %s%s \n%s%b ' \
        (set_color 00FFAF) (date "+%H:%M:%S") (set_color normal) \
        (set_color D787AF) $USER (prompt_hostname) \
        (set_color 5FAFFF) (prompt_pwd -d 3 -D 3) \
        $pipestatus_string (set_color normal) \
        $fish_str \
        "\x1b[5 q"

end
