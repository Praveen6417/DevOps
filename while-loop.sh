#!/bin/bash

echo "Enter the value:"
read value

while [ $value -lt 5 ]
do 
    echo "Number : $value"
    ((value++))
done

if [ "$value" -ge 5 ]
then
    echo "Value is not less than 5"
fi