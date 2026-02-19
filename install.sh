apt update && apt install unzip -y
wget https://github.com/azainal093/mikhmon_v4/raw/refs/heads/main/mikhmonv4.rar
mkdir mikhmonv4
unzip mikhmonv4.zip -d /mikhmonv4
cat << 'EOF' | sudo tee /etc/systemd/system/mikhmon.service
[Unit]
Description=Mikhmon v4 PHP Built-in Server
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/mikhmonv4
ExecStart=/usr/bin/php -S 0.0.0.0:8080
Restart=always
RestartSec=3

# (opsional) log masuk ke journald, bisa dilihat pakai journalctl
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable --now mikhmonv4.service
sudo systemctl status mikhmonv4.service --no-pager