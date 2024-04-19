USERID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo "$0" | cut -d "." -f1)
logfile=/tmp/$timestamp-$script_name.log

if [ $USERID -ne 0 ]
then
    echo "Install Packages using root access"
    exit 1
else
    echo "You are Super User"
fi

for i in $@
do 
    echo "Attempting to install $i"

    dnf list installed $i &>> $logfile

   # dnf install $i -y &>> $logfile

    if [ $? -eq 0 ]
    then
        echo "$i installed successfully"
    else 
        echo "Failed to install $i."
    fi
done
