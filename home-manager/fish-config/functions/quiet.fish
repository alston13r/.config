function quiet --description "Run a command in the background with zero output"
    if test (count $argv) -gt 0
        $argv &>/dev/null &; disown
    else
        echo "Usage: quiet <command>"
    end
end
