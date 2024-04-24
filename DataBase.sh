source common.sh


dnf install mysql-server -y &>> logfile

systemctl enable mysqld &>> logfile

systemctl start mysqld &>> logfile

mysql -h 18.215.143.50 -u root -p -e 'show databases;' &>>$logfile


if [ $? -eq 0 ]; then
    echo "MySQL root password is already set or updated."
    exit 1
else
    echo "Setting MySQL root password..."
    mysql_secure_installation --set-root-pass ExpenseApp@1
    if [ $? -eq 0 ]; then
        echo "MySQL root password set successfully."
    else
        echo "Failed to set MySQL root password."
        exit 1
    fi
fi
