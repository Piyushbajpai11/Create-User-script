#!/bin/bash

LOGFILE="user_creation.log"
USERNAME="$1"

# check if script is run as root"

if [[ $EUID -ne 0 ]]; then
	echo"❌ Please run this script as root."
	exit 1
fi

# check if username is provided 
if [[ -z "$USERNAME" ]]; then
	read -p "Enter username to create: " USERNAME
fi

# check if user already exists
if id "$USERNAME" &>/dev/null; then
	echo "⚠️  User '$USERNAME' already exists"
	echo "$(date): ❌ User '$USERNAME' already exists" >> "$LOGFILE"
:wq	exit 1
fi


# Generating a password of 12-character
PASSWORD=$(openssl rand -base64 12)

# create the user
useradd -m "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
chage -d 0 "USERNAME"

# Log details 
echo "$(date): ✅ User '$USERNAME' created with password '$PASSWORD' " >> "$LOGFILE"


# Output success 
echo "✅ User '$USERNAME' created."
echo "🔐 Temporary password: $PASSWORD"
