Disk_usage=$(df -hT | grep xfs)

while IFS=read -r line
do 
    echo "$line"
    
done < $Disk_usage