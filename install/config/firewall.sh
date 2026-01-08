# Configure firewalld for Fedora
sudo systemctl enable firewalld
sudo systemctl start firewalld

# Allow common services
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=mdns
sudo firewall-cmd --reload
