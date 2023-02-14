#!/bin/sh
#basic tests of shared hosting on linux servers at Locaweb

$hm=$(hostname -i)
$data=$(date +'%Y_5m_%d')
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

mv php.ini php.ini_cliente123 && cp/etc/php.ini . &&
sed-i 's/max_execution_time= 30/max_execution_time= 90/' php.ini &&
sed-i 's/max_input_time= 60/max_input_time= 90/' php.ini &&
sed-i 's/memory_limit= 32M/memory_limit= 512M/' php.ini &&
sed-i 's/post_max_size= 8M/post_max_size= 50M/' php.ini &&
sed-i 's/upload_max_filesize= 2M/upload_max_filesize= 50M/' php.ini &&
sed-i '954i session.save_path= "/home/'$USER'/tmp"' php.ini &&
sed-i '955d' php.ini

echo "----------------- Ajustes no htaccess -------------------"
echo "Aperte enter para realizar a alteração do htaccess"
read

$ cd ~/public_html
$ mv .htacces .htaccess_antigo
echo "-----------------------------------"
echo "Informe o usuario de FTP:"
read ftpuser
echo "Qual versão de PHP o cliente vai querer usar?"
read phpver
echo "vai forçar o uso do HTTPS?, se sim, informe o dominio para o redirecionamento:"
read domainssl


echo "
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
"
echo ""
echo "--------------------------"
echo "Copie o conteudo a ser mostrado e cole no seu .htaccess"
read prompthtaccess

vim ~/public_html/.htaccess
