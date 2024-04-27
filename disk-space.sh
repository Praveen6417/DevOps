Disk_usage=$(df -hT | grep xfs)
Disk_max=75

while IFS= read -r line
do 
    usage+=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 \n)
    # folder=$(echo $line | awk -F " " '{print $NF}')
    # if [ $usage -gt $Disk_max ]
    # then
    #     echo ("$folder usage is more than $Disk_max, Current usage : $usage")
    # else
    #     echo ("Current usage :$usage")
    # fi

done <<< $Disk_usage

echo "Hii"
echo "$usage"