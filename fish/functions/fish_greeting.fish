function fish_greeting --description "Greeting message"

    printf '\x1b[%sS\x1b[H' $LINES
    cat motd.txt

end
