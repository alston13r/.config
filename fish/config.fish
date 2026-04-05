if status is-interactive

    # alias function
    function l
        ls -CF --color $argv
    end

    # set text editor
    set -gx EDITOR nvim

    # abbreviations
    function multicd
        set -l length (math (string length -- $argv) - 1)
        echo cd (string repeat -n $length ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd

end
