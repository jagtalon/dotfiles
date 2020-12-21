function tarsnap
    switch $argv[1]
        case stats
            command tarsnap --print-stats --humanize
        case archives
            command tarsnap --list-archives | sort
        case extract
            command tarsnap --fast-read -xf $argv[2..-1]
        case ls
            command tarsnap -tf $argv[2..-1]
        case '*'
            command tarsnap $argv
    end
end