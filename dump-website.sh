wget -q -R "*.png, *.jpg, *.gif" -O {output.filename} -r -erobots=off -l2 -np {website url}

#to use a list of input web addresses, use -i {filename.txt}
