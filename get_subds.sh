# One liner to extract working sub-somains of a target and do something with them (on this case open them in Firefox).

subfinder -d target.tld -t 100 -silent | httprobe -c 50 | sort -u | while read line; do firefox $line; sleep 10; done
