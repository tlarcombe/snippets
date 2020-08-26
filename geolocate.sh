#This is using the free api key - I would rather you didn't rip it off but it is trivial to recreate.
#Signup and the api key are free - just go to https://ipdata.co to get yours.

cat inputips.csv | while read IPS; do 

curl https://api.ipdata.co/"$IPS"?api-key=1f25ff40e5e1bdde99983aa901bc64cf20e15fbead346c1d5ee469cb >> output.txt;

#Compare the output

curl https://api.ipregistry.co/109.203.102.121?key=tryout&pretty=true

done
