#!/bin/bash
read -p "Please enter target domain name and filename to save to " domain filename
echo "Getting all unique subdomains of $domain from crt.sh and saving them to $filename"
curl -s https://crt.sh/?q=$domain\&output\=json | jq | grep "common_name\|name_value" | cut -d ":" -f2 | cut -d '"' -f2 | awk '{gsub(/\\n/,"\n");}1;' | sort -u | tee $filename
