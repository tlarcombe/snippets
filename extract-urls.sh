#Get truncated urls

wget -qO- http://google.com/ | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '(http|https)://[^/"]+'


#Get urls with sibdirectories

cat {sourcefile} | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '(http|https)://[^?"]+' 
