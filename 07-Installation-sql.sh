USERID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo "$0" | cut -d "." -f1)
logfile=/tmp/$timestamp-$script_name.log

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


dnf install mysql -y &>> $logfile
Validate $? "MySQL" "Successfully Installed MySQL"

dnf install gitt -y 1>&2 >> $logfile
Validate $? "Git" "Successfully Installed Git"