USERID=$(id -u)

Validate(){
    if [ $1 -ne 0 ]
    then
        echo "Installation of $2 is unsuccessful"
        exit 1
    else
        echo $3
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Please run this script using root access "
    exit 1
else
    echo "you are super user"
fi


dnf install mysql -y
Validate $? "MySQL" "Successfully Installed MySQL"

dnf install git -y
Validate $? "Git" "Successfully Installed Git"