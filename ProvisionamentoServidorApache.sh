#!/bin/bash

# Obtendo o IP do computador
IP=$(hostname -I | awk '{print $1}')

# Atulizando o sistema
sudo yum update -y
sudo yum upgrade -y

# Instalando o Apache
echo "Instalando o Apache2..."
sudo yum install apache2 -y

# Instalando o utilitário curl (serve para testar a instalação do servidor web)
echo "Instalando o curl..."
sudo apt install curl -y

# Iniciando e habilitando o Apache
echo "Iniciando o Apache2..."
sudo systemctl start apache2
sudo systemctl enable apache2

# Verificando o status do Apache
echo "Verificando o status do Apache2..."
sudo systemctl status apache2

# Verificando se o servidor Apache está respondendo na porta 80
echo "Verificando se o servidor está respondendo na porta 80..."
curl -I http://localhost

# Adicionando uma página HTML simples
echo "Criando uma página HTML simples..."
echo "<html><body><h1>Servidor Web Apache funcionando perfeitamente!</h1></body></html>" | sudo tee /var/www/html/index.html

# Permissões para garantir que o Apache possa acessar o diretório
echo "Garantindo permissões adequadas para o diretório /var/www/html..."
sudo chown -R www-data:www-data /var/www/html

# Recarregando o Apache para aplicar quaisquer mudanças
echo "Recarregando o Apache..."
sudo systemctl reload apache2

# Confirmando a instalação do servidor web
echo "Servidor web Apache instalado e em funcionamento."
echo "Acesse em http://localhost  ou  http://$IP"


