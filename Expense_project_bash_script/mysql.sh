dnf install mysql-server -y
systemctl enable msqld
systemctl start msqlmd
mysql_secure_installation --set-root-pass ExpenseApp@1
echo "**mysql installation completed*   *"