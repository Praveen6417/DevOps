if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 2>&1
    exit 1
fi

dnf install mysql -y