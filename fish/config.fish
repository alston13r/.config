if status is-interactive
    # Commands to run in interactive sessions can go here

    # alias function
    function l
        ls -CF --color $argv
    end

    # set text editor
    set -gx EDITOR nvim

end
