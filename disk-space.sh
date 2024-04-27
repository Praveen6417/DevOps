Disk_usage=$(df -hT | grep xfs)
Disk_max=75
Message=""

while IFS= read -r line
do 
    usage=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    folder=$(echo $line | awk -F " " '{print $NF}')
    if [ $usage -gt $Disk_max ]
    then
        Message="Current usage :$usage"
    fi

done <<< $Disk_usage

echo "Hii"
echo $Message