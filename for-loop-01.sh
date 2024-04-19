for i in {1..5}; do
    if [ $i -eq 3 ]; then
        continue  # Skip the rest of the loop for i equals 3
    fi
    echo "Processing number $i"
done

for i in {1..5}; do
    if [ $i -eq 3 ]; then
        exit 1  # Skip the rest of the loop for i equals 3
    fi
    echo "Processing number $i"
done

for i in {1..5}; do
    if [ $i -eq 3 ]; then
        echo "Hii"
    fi
    echo "Processing number $i"
done