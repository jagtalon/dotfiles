function tarsnap
    switch $argv[1]
        case stats
            command tarsnap --print-stats --humanize
        case archives
            command tarsnap --list-archives | sort
        case extract
            command tarsnap -xf $argv[2..-1]
        case ls
            command tarsnap -tf $argv[2..-1]
        case prune
            command tarsnap --list-archives | /usr/local/bin/prunef --keep-secondly 5 --keep-hourly 6 --keep-daily 7 --keep-weekly 4 --keep-monthly 12 "Jag-%Y-%m-%d_%H-%M-%S" | xargs --no-run-if-empty -n1 tarsnap -df
        case '*'
            command tarsnap $argv
    end
end