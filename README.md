# Gerador de Let's Encrypt para Hospadagens Locaweb

Pequena automatização do script: [https://github.com/acmesh-official/acme.sh](https://github.com/acmesh-official/acme.sh)


Ao invés de ter que utilizar diversos comandos conforme o [guia da Locaweb](https://ajuda.locaweb.com.br/wiki/certificado-lets-encrypt/), com este script você precisa apenas indicar o dominio. 


# Como utilizar?

1. Acesse o FTP do seu site via [SSH](https://ajuda.locaweb.com.br/wiki/como-habilitar-o-ssh-hospedagem-de-sites/). 

2. Execute este comando: 

`curl -O https://raw.githubusercontent.com/IESXS/Locaweb_basictests/main/basic_tests.sh && sh basic_tests.sh`


3. Informe o seu usuario de ftp para a criação do php.ini
4. informe o usuario de ftp, a versão de php, e o seu dominio.
5. realize testes para ver se funcionou

# Funciona em todas as hospedagens? 

Apenas em hospedagens Linux.
