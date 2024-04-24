source ./common.sh

check_root

trap 'error_handling ${LINENO} "$BASH_COMMAND"' ERR

dnf install nginx -y &>> $logfile

systemctl enable nginx &>> $logfile

systemctl start nginx &>> $logfile

rm -rf /usr/share/nginx/html/* $>> $logfile

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>> $logfile

cd /usr/share/nginx/html &>> $logfile
unzip /tmp/frontend.zip &>> $logfile

#check your repo and path
cp /home/ec2-user/DevOps/expense.conf /etc/nginx/default.d/expense.conf &>> $logfile

systemctl restart nginx &>> $logfile