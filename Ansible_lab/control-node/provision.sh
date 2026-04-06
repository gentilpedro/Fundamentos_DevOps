#!/usr/bin/env bash
echo "Instalando e configurando dependencias..."
sudo dnf install nano
echo "Instalando EPEL repository..."
sudo dnf install -y epel-release

echo "Instalando Ansible..."
sudo dnf install -y ansible

echo "Configurando o /etc/hosts..."
sudo tee -a /etc/hosts > /dev/null <<EOT
192.168.1.2 control-node
192.168.1.3 app-01
192.168.1.4 db-01
EOT

