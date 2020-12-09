#!/usr/bin/fish

set directories "/mnt/c/Users/jag/Documents" "/mnt/c/Users/jag/Desktop" "/home/jag"

/usr/bin/tarsnap -v -c -f (uname -n)"-"(date +%Y-%m-%d_%H-%M-%S) \
    $directories