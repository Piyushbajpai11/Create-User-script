# 👤 Linux User Account Creator

A bash script to automate Linux user creation with secure passwords, validation, and logging.

## 📦 Features

- Creates a new Linux user
- Generates a strong random password
- Forces password change at next login
- Logs all actions to `user_creation.log`
- Handles errors (e.g., if user exists)
- Fully terminal-based and beginner friendly

## 🚀 Usage

```bash
chmod +x create_user.sh
sudo ./create_user.sh <username>
```

## 📁 Log File

All creation events are stored in user_creation.log

Includes timestamp, username, and generated password

## 💡 Notes

You must run the script as root.
The user will be required to change password on first login.
Uses chage -d 0 (more stable than passwd -e for scripting)

## 📸 Example

```bash
Copy code
$ sudo ./create_user.sh devops123

✅ User 'devops123' created.
🔐 Temporary password: wJ7ksd2L+8kP
```

## 👨‍💻 Author

Your Name – Piyush
