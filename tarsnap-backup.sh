#!/usr/bin/fish

# List directories to be backed up.
set directories "/mnt/c/Users/jag/Documents" "/mnt/c/Users/jag/Desktop" "/home/jag"

# Start backup.
/usr/bin/tarsnap -v -c -f (uname -n)"-"(date +%Y-%m-%d_%H-%M-%S) \
    $directories

# Prune unnecessary files.
/usr/bin/tarsnap --list-archives | /usr/local/bin/prunef --keep-secondly 5 --keep-hourly 6 --keep-daily 7 --keep-weekly 4 --keep-monthly 12 "Jag-%Y-%m-%d_%H-%M-%S" | xargs --no-run-if-empty -n1 tarsnap -df