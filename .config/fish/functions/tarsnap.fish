function tarsnap
    switch $argv[1]
        case stats
            command tarsnap --print-stats --humanize
        case archives
            command tarsnap --list-archives | sort | tail
        case extract
            command tarsnap -xf $argv[2..-1]
        case ls
            command tarsnap -tf $argv[2..-1]
        case prune
            command tarsnap --list-archives | prunef --keep-hourly 4 --keep-daily 7 --keep-weekly 4 --keep-monthly 12 "Jag-%Y-%m-%d_%H-%M-%S" | xargs -n1 tarsnap -df
        case '*'
            command tarsnap $argv
    end
end