echo "Enter the value"
read value

if [[ value -eq 10 ]]
then
    echo "Successful"
else 
    echo "Unsuccessful"
fi

dnf install mysql 2> logfile

dnf install dockerr 1>> logfile