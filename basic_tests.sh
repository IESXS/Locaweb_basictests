#!/bin/sh
#basic tests of shared hosting on linux servers at Locaweb
clear
echo "
██       ██████   ██████  █████  ██     ██ ███████ ██████
██      ██    ██ ██      ██   ██ ██     ██ ██      ██   ██
██      ██    ██ ██      ███████ ██  █  ██ █████   ██████
██      ██    ██ ██      ██   ██ ██ ███ ██ ██      ██   ██
███████  ██████   ██████ ██   ██  ███ ███  ███████ ██████
"
echo "------------------ Ajustes no php.ini -------------------"
echo "para qual usuario de ftp esta realizando o ajuste?"
read ftpuser
mv php.ini php.ini_$(date +'%Y_%m_%d')
curl -O https://raw.githubusercontent.com/IESXS/Locaweb_basictests/main/php.ini

echo "----------------- Ajustes no htaccess -------------------"
echo "Aperte enter para realizar a alteração do htaccess"
read

cd public_html
mv .htacces .htaccess_$(date +'%Y_%m_%d')
echo "-----------------------------------"
echo "Qual versão de PHP o cliente vai querer usar?"
read phpver
echo "vai forçar o uso do HTTPS?, se sim, informe o dominio para o redirecionamento:"
read domainssl

cat > .htacces <<EOF
AddHandler php$phpver-script .php
suPHP_ConfigPath /$ftpuser/
##### LOCAWEB - NAO REMOVER #####
#RewriteEngine On
#RewriteCond %{SERVER_PORT} 80
#RewriteRule ^(.*)$ https://www.$domainssl/$1 [R,L]
# BEGIN WordPress
# As diretrizes (linhas) entre `BEGIN WordPress` e` END WordPress` são
# geradas dinamicamente e só devem ser modificadas através de filtros do WordPress.
# Quaisquer alterações nas diretivas entre esses marcadores serão sobrescritas.
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /site_in/
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /site_in/index.php [L]
</IfModule>
# END WordPress
EOF

echo ""
echo "--------------------------"
echo "php.ini e .htaccess resetadas com sucesso!"
read prompthtaccess
