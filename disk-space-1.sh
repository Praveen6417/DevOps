# Collect all lines containing 'xfs' from the df output
Disk_usage=$(df -hT | grep xfs)

# Read each line from Disk_usage
echo "$Disk_usage" | while IFS= read -r line
do 
    # Extract the sixth field and then strip the percent sign
    usage=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
done

# Output the last usage value collected in the loop
echo "$usage"
