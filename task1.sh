#!/bin/bash


websites=("https://google.com" "https://facebook.com" "https://twitter.com")


log_file="website_status.log"


for site in "${websites[@]}"; do
    #if curl -s --head "$site" | head -n 1 | grep "HTTP/1.[01] [23].." > /dev/null; then
    if curl -s -L --head --request GET -w "%{http_code}\n" "$site" | grep "200" > /dev/null; then
        echo "$site is UP" >> "$log_file"
        echo "$site is UP" 
    else
        echo "$site is DOWN" >> "$log_file"
        echo "$site is DOWN" 
    fi
done

# Вивід повідомлення про завершення та назву файлу логів
echo "Результати перевірки записано у файл: $log_file"
