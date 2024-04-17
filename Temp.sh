if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    
fi

dnf install mysql -y