#!/bin/sh
#basic tests of shared hosting on linux servers at Locaweb
#Obtém o usuário FTP
ftpuser=$(pwd | rev | cut -d '/' -f 1 | rev)
clear
echo "
██       ██████   ██████  █████  ██     ██ ███████ ██████
██      ██    ██ ██      ██   ██ ██     ██ ██      ██   ██
██      ██    ██ ██      ███████ ██  █  ██ █████   ██████
██      ██    ██ ██      ██   ██ ██ ███ ██ ██      ██   ██
███████  ██████   ██████ ██   ██  ███ ███  ███████ ██████
"
echo "para uso interno do suporte da locaweb"

echo ""
echo "Aperte enter para realizar a alteração do php.ini"
read

echo "------------------ Ajustes no php.ini -------------------"
echo "para qual usuario de ftp esta realizando o ajuste?"
read ftpuser

# renomeia qualquer php.ini que estja na raiz e faz o download do php.ini padrão;
#não sendo necessário alterar o session save path, pois usa a diretiva $USER;
mv php.ini php.ini_$(date +'%Y_%m_%d')
curl -O https://raw.githubusercontent.com/IESXS/Locaweb_basictests/main/php.ini

echo ""
echo "----------------- Ajustes no htaccess -------------------"
echo "Aperte enter para realizar a alteração do htaccess"
read

# renomeia qualquer .htaccess que esteja na public_html e gera um novo, definindo;
#o usuario de FTP e versão de php nas requisições "ftpuser" e "phpver";
cd public_html
mv .htaccess .htaccess_$(date +'%Y_%m_%d')
echo "-----------------------------------"
echo "Qual versão de PHP o cliente vai querer usar?"
echo "Versões de PHP disponiveis:
        php 5.6 - '56'
        php 7.0 - '70'
        php 7.1 - '71'
        php 7.2 - '72'
        php 7.3 - '73'
        php 7.4 - '74'
        php 8.0 - '80' 
     "
echo "digite a versão desejada:"
read phpver

#esta parte serve para deixar as linhas para forçar SSL semiprontas;
#faltando apenas remover os "#" do .htaccess
echo "Insira o dominio para forçar o SSL (lembre-se de descomentar as linhas após a criação do arquivo)"
read domainssl

#comando que vai gerar o certificado com as requisições acima;
cat > .htaccess <<EOF
##### LOCAWEB - NAO REMOVER #####
AddHandler php$phpver-script .php
suPHP_ConfigPath /$ftpuser/
##### LOCAWEB - NAO REMOVER #####

#RewriteEngine On
#RewriteCond %{SERVER_PORT} 80
#RewriteRule ^(.*)$ https://www.$domainssl/$"1 [R,L]
EOF

#cria um info.php para validar alterações no php.ini e .htaccess, como versão de php, ou diretivas;
#de memoria, upload, etc;
cat > info_teste.php <<EOF
<?php
phpinfo();
?>
EOF

echo ""
echo "--------------------------"
echo "php.ini e .htaccess resetadas com sucesso!"
echo "Aperte enter para finalizar o script!"
read 
