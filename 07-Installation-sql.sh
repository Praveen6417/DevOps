USERID=$(id -u)

Validate(){
    echo "exit status: $1"
    echo $2
}

if [ $USERID -ne 0 ]
then 
    echo "Please run this script using root access "
    exit 1
else
    echo "you are super user"
fi


dnf install mysql -y
Validate $? "Successfully Installed MySQL"