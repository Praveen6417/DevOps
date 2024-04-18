USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script using root access - Exit status $?"
    exit 1
else
    echo "you are super user"
fi

if [ $? -ne 0 ]
then 
    echo "Installing MySQL....FAILURE - Exit status $?"
    exit 1
else
    echo "Installing MySQL....SUCCESS"
fi

dnf install mysql -y