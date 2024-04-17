if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 
    
fi

dnf install mysql -y