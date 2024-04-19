echo "Enter the value"
read value

if [[ value -eq 10 ]]
then
    echo "Successful"
else 
    echo "Unsuccessful"
fi

dnf install mysql 1> logfile

dnf install dockerr 2>> logfile