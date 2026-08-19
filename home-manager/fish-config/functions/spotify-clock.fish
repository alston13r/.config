function spotify-clock --description "Display current track (use --center for dashboard mode)"
    # Check if centering is requested
    set -l center_mode false
    if contains -- "--center" $argv; or contains -- "-c" $argv
        set center_mode true
    end

    tput civis
    stty -echo
    if test "$center_mode" = true; clear; end
    
    # Unified trap to handle cleanup regardless of mode
    trap "tput cnorm; stty echo; tput sgr0; clear; return" INT TERM EXIT

    # We pass the center_mode variable into the child fish process
    fish -c "
    set last_cols 0
    set last_lines 0

    while true
        set cols (tput cols)
        set lines (tput lines)
        
        if playerctl status --player=spotify >/dev/null 2>&1
            set pos (playerctl metadata --format '{{ duration(position) }}')
            set len (playerctl metadata --format '{{ duration(mpris:length) }}')
            set title (playerctl metadata --format '{{ title }}')
            set artist (playerctl metadata --format '{{ artist }}')
            set out_str \"\$pos / \$len | \"
            set tail_str \" - \$artist\"

            if test \"$center_mode\" = true
                # Dashboard Logic (Centered)
                if test \$cols -ne \$last_cols -o \$lines -ne \$last_lines
                    clear; set last_cols \$cols; set last_lines \$lines
                end
                
                set v_center (math \"floor(\$lines / 2)\")
                set str_len (string length \"\$pos / \$len | \$title - \$artist\")
                set padding (math \"floor((\$cols - \$str_len) / 2)\")
                if test \$padding -lt 0; set padding 0; end

                tput cup \$v_center 0
                echo -ne \"\r\"(string repeat -n \$padding ' ')\"\$out_str\"
                set_color --bold; echo -ne \"\$title\"; set_color normal
                echo -ne \"\$tail_str\e[K\"
            else
                # Standard Logic (Bottom-line)
                echo -ne \"\r\$out_str\"
                set_color --bold; echo -ne \"\$title\"; set_color normal
                echo -ne \"\$tail_str\e[K\"
            end
        else
            if test \"\$center_mode\" = true
                set v_center (math \"floor(\$lines / 2)\")
                tput cup \$v_center 0
                echo -ne \"\r\"(string repeat -n (math \"floor((\$cols - 18) / 2)\") ' ')\"Spotify offline...\e[K\"
            else
                echo -ne \"\rSpotify is offline...\e[K\"
            end
        end
        command sleep 0.1
    end
    " | cat
end
