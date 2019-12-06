wget -qO- http://google.com/ |
grep -Eoi '<a [^>]+>' |
grep -Eo 'href="[^\"]+"' |
grep -Eo '(http|https)://[^/"]+'
