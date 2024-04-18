#!/bin/bash

echo "Enter the value:"
read value

while[$value lt 5]
do 
    echo "Number : $value"
    ((value++))
done