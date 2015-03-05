#!/bin/bash

# mega-dl
# Thanks to http://hacktracking.blogspot.com.au/2013/07/download-mega-files-from-command-line.html

url=$1
enc_file=${2}.enc
out_file=$2

id=$(echo $url | awk -F '!' '{print $2}')
key=$(echo $url | awk -F '!' '{print $3}' | sed -e 's/-/+/g' -e 's/_/\//g' -e 's/,//g')
b64_hex_key=$(echo -n $key | base64 --decode --ignore-garbage 2> /dev/null | xxd -p | tr -d '\n')
key[0]=$(( 0x${b64_hex_key:00:16} ^ 0x${b64_hex_key:32:16} ))
key[1]=$(( 0x${b64_hex_key:16:16} ^ 0x${b64_hex_key:48:16} ))
key=$(printf "%x" ${key[*]})
iv="${b64_hex_key:32:16}0000000000000000"
new_url=$(curl --silent --request POST --data-binary '[{"a":"g","g":1,"p":"'$id'"}]' https://eu.api.mega.co.nz/cs | awk -F '"' '{print $10}')
curl --output $enc_file $new_url
openssl enc -d -aes-128-ctr -K $key -iv $iv -in $enc_file -out $out_file
rm -f $enc_file
# url='https://mega.co.nz/#!HFsiWYrJ!VkovRDl9kJkIMDBkiRlw-E9OGOkcD1DbNqs3d-CGNf8'
# ./mega-dl $url toulouse.mp4
# file toulouse.mp4
