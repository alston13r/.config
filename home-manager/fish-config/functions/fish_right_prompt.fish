function fish_right_prompt --description "The right-side of the prompt"

    # git branch
    set -l branch_color (set_color -u FFFF00)
    set -l branch (git branch --show-current 2>/dev/null)

    if test -n "$branch"

        printf '[%s%s%s]' \
            $branch_color $branch (set_color normal)

    end

end
