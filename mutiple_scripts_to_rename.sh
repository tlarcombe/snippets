#The fisrt script will do something like a rename function

!/bin/sh
NEW="${1%.*}".jpg
convert "$1" "$NEW"

#save that as convert_to_jpg.sh and make it executable:
chmod +x convert_to_jpg.sh


#then you want to find all the files in question:

find /path/to/root -type f \( -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' \)
#(it will likely spew lots of output of all the filenames, use ^C to terminate it)

#We can then execute our shell-script on each of those files:
find /path/to/root -type f \( -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' \) -exec ./convert_to_jpg.sh
