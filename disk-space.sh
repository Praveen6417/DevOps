Disk_usage=$(df -hT | grep xfs)

while IFS=read -r line
do 
    usage=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)

done <<< $Disk_usage

echo "Hii"