#!/bin/bash

#usage:
# ./web_scraping.sh
# Description:
# Web Scrapping 

search() {
    echo "[+] Checking: $url"

    result=$(curl -I -s -L --max-time 10 "$url")

    {
        echo "*********************************************"
        echo "URL: $url"
        echo
        echo "$result"
        echo
    } >> search_result.txt
}

readarray -t urls < /home/kali/bash_project/url.txt

> search_result.txt   # clear old results

for url in "${urls[@]}"; do
    [[ -z "$url" ]] && continue
    search
done

exit 0
