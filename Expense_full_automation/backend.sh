dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
useradd expense
mkdir /app
cd /app
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip
unzip -o /tmp/backend.zip
npm install
cp /home/ec2-user/DevOps/Expense_project_bash_script/backend.service /etc/systemd/system/backend.service
chown -R expense:expense /app
chmod 775 /app
dnf install mysql-server -y
PRIVATE_IP=$(hostname -I | awk '{print $1}')
mysql -h "$PRIVATE_IP" -u root -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload
systemctl enable backend 
systemctl start backend