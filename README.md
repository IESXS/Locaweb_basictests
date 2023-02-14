# Testes basicos a serem feitos em sites da hospedagem compartilhada na locaweb

Ao invés de ter que recriar os arquivos manualmente, utilize esse comando para automatizar o processo


# Como utilizar?

1. Acesse o FTP do seu site via [SSH](https://ajuda.locaweb.com.br/wiki/como-habilitar-o-ssh-hospedagem-de-sites/). 

2. Execute este comando: 

`curl -O https://raw.githubusercontent.com/IESXS/Locaweb_basictests/main/basic_tests.sh && sh basic_tests.sh`


3. Informe o seu usuario de ftp para a criação do php.ini
4. informe o usuario de ftp, a versão de php, e o seu dominio.
5. realize testes para ver se funcionou

# Funciona em todas as hospedagens? 

Apenas em hospedagens Linux.
