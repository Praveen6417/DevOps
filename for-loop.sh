#!/bin/bash

for value in {1..10}
do
echo "Number: $value"
done

for fruit in apple banana orange
do
    echo "Fruit: $fruit"
done

for i in {1..3}
do
    echo "Outer loop iteration: $i"
    for j in {1..2}
    do
        echo "Inner loop iteration: $j"
    done
done
