#!/usr/bin/env bash

# mega-dl
# Thanks to http://hacktracking.blogspot.com.au/2013/07/download-mega-files-from-command-line.html
# and also http://pastebin.com/raw.php?i=xFD2qXbL

url=$1
out_file=$2
enc_file=${2}.enc

# get id and key from url
id=$(echo $url | awk -F '!' '{print $2}')
key=$(echo $url | awk -F '!' '{print $3}' | sed -e 's/-/+/g' -e 's/_/\//g' -e 's/,//g')

# decode key
b64_hex_key=$(echo -n $key | base64 --decode --ignore-garbage 2> /dev/null | xxd -p | tr -d '\n')
key[0]=$(( 0x${b64_hex_key:00:16} ^ 0x${b64_hex_key:32:16} ))
key[1]=$(( 0x${b64_hex_key:16:16} ^ 0x${b64_hex_key:48:16} ))
key=$(printf "%x" ${key[*]})
iv="${b64_hex_key:32:16}0000000000000000"

# send the request
json_data=`curl --silent --request POST --data-binary '[{"a":"g","g":1,"p":"'$id'"}]' https://eu.api.mega.co.nz/cs`

# get the download url
new_url=`echo $json_data | awk -F '"' '{print $12}'`

# Download, decrypt, clean up
curl --output $enc_file $new_url
openssl enc -d -aes-128-ctr -K $key -iv $iv -in $enc_file -out $out_file
rm -f $enc_file
