temp(){
    echo "Hello, world"
}

temp

temp1(){

    echo "i am $1"
}

temp1 "THE HULK"

#!/bin/bash

# Function definitions
function add() {
    echo "Addition result: $(($1 + $2))"
}

function subtract() {
    echo "Subtraction result: $(($1 - $2))"
}

# Asking for user input
echo "Enter two numbers:"
read a b

echo "Choose operation: add or subtract"
read operation

# Call function based on user input
if [[ "$operation" == "add" ]]; then
    add $a $b
elif [[ "$operation" == "subtract" ]]; then
    subtract $a $b
else
    echo "Invalid operation"
fi
