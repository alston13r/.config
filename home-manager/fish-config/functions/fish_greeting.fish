function fish_greeting --description "Greeting message"

    # scroll page
    printf '\x1b[%sS\x1b[H' $LINES

    if type -q fish_logo
        # use fish_logo function

        # get some random colors
        set -l colors red blue green yellow cyan magenta white
        set -l N (count $colors)
        set -l outer $colors[(math "$(random) % $N + 1")]
        set -l medium $colors[(math "$(random) % $N + 1")]
        set -l inner $colors[(math "$(random) % $N + 1")]

        fish_logo $outer $medium $inner

    else
        # use MOTD text file
        cat motd.txt
    end

end
